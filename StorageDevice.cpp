
#include "Sd2Card.h"

typedef uint32_t flash_addr_t;
typedef uint32_t page_size_t;
typedef uint32_t page_count_t;

/**
 * Function that performs the data transformation when relocating a page in flash.
 */
typedef void (*TransferHandler)(page_size_t pageOffset, void* data, uint8_t* buf, page_size_t bufSize);

#ifndef min
// allow standalone use where Arduino/Spark min macro may not be available.

template <class T> T min(T a, T b) {
    return a < b ? a : b;
}
#endif

inline uint8_t* as_bytes(void* buf) {
    return (uint8_t*) buf;
}

inline const uint8_t* as_bytes(const void* buf) {
    return (const uint8_t*) buf;
}


/**
 * Provides an interface to a flash device.
 * Reads/Writes can span multiple pages, and be any arbitrary length or offset.
 */
class FlashDevice {
public:
    virtual ~FlashDevice() {}

    /**
     * @return The size of each page in this flash device.
     */
    virtual page_size_t pageSize() const = 0;

    /**
     * @return The number of pages in this flash device.
     */
    virtual page_count_t pageCount() const = 0;

    flash_addr_t length() const {
        return pageAddress(pageCount());
    }

    inline bool write(const void* data, flash_addr_t address, page_size_t length) {
        return writeErasePage(data, address, length);
    }

    inline bool read(void* data, flash_addr_t address, page_size_t length) {
        return readPage(data, address, length);
    }

    inline bool writeString(const char* s, flash_addr_t address) {
        return write(s, address, strlen(s));
    }

    /**
     * Converts a page index [0,N) into the corresponding read/write address.
     * @param page  The page to convert to an address.
     * @return
     */
    flash_addr_t pageAddress(page_count_t page) const {
        return flash_addr_t(page) * pageSize();
    }

    /**
     * Determines if the given address represents the start of a page.
     */
    bool isPageAddress(flash_addr_t address) const {
        return (address % pageSize()) == 0;
    }

    bool writeEraseByte(uint8_t data, flash_addr_t address) {
        return writeErasePage(&data, address, 1);
    }

    uint8_t readByte(flash_addr_t address) const {
        uint8_t data = 0xFF;
        readPage(&data, address, 1);
        return data;
    }

    virtual bool erasePage(flash_addr_t address) = 0;

    bool eraseAll() {
        flash_addr_t end = length();
        flash_addr_t size = pageSize();
        bool success = true;
        for (flash_addr_t i = 0; i<end; i+=size) {
            success = success && erasePage(i);
        }
        return success;
    }

    /**
     * Writes directly to the flash. Depending upon the state of the flash, the
     * write may provide the data required or it may not.
     * @param data
     * @param address
     * @param length
     * @return
     */
    virtual bool writePage(const void* data, flash_addr_t address, page_size_t length) = 0;


    virtual bool readPage(void* data, flash_addr_t address, page_size_t length) const = 0;

    /**
     * Writes data to the flash memory, performing an erase beforehand if necessary
     * to ensure the data is written correctly.
     * @param data
     * @param address
     * @param length
     * @return
     */
    virtual bool writeErasePage(const void* data, flash_addr_t address, page_size_t length) = 0;

    /**
     * Internally re-reorganizes the page's storage by passing the page contents via
     * a buffer through a handler function and then writing the buffer back to
     * memory.
     *
     * This is not part of the public API and is for use only by the library.
     *
     * @param address
     * @param handler
     * @param data
     * @param buf
     * @param bufSize
     * @return
     */
    virtual bool copyPage(flash_addr_t address, TransferHandler handler, void* data, uint8_t* buf, page_size_t bufSize) = 0;

};


/**
 * A flash device implementation that uses a block of dynamically allocated RAM
 * as the emulated backing store for the flash device.
 * Writes are logically ANDed with the existing data to emulate NAND flash behaviour.
 */
class FakeFlashDevice : public FlashDevice {
    page_count_t pageCount_;
    page_size_t pageSize_;
    uint8_t* data_;

    inline bool isValidRegion(flash_addr_t address, page_size_t length) const {
        return address + length <= pageSize() * pageCount();
    }

public:

    FakeFlashDevice(page_count_t pageCount, page_size_t pageSize) :
    pageCount_(pageCount), pageSize_(pageSize) {
        flash_addr_t size = length();
        data_ = new uint8_t[size];
    }

    virtual ~FakeFlashDevice() {
        delete[] data_;
    }

    void eraseAll() {
        memset(data_, -1, length());
    }

    /**
     * @return The size of each page in this flash device.
     */
    virtual page_size_t pageSize() const {
        return pageSize_;
    }

    /**
     * @return The number of pages in this flash device.
     */
    virtual page_count_t pageCount() const {
        return pageCount_;
    }

    virtual bool erasePage(flash_addr_t address) {
        bool success = false;
        if (isPageAddress(address)) {
            memset(data_ + address, 0xFF, pageSize());
            success = true;
        }
        return success;
    }

    /**
     * Only writes an even number of bytes to an even address.
     * @param data
     * @param address
     * @param length
     * @return
     */
    virtual bool writePage(const void* _data, flash_addr_t address, page_size_t length) {
        bool success = false;
        const uint8_t* data = as_bytes(_data);
        if (isValidRegion(address, length)) {
            for (; length-- > 0;) {
                this->data_[address++] &= *data++;
            }
            success = true;
        }
        return success;
    }

    virtual bool readPage(void* data, flash_addr_t address, page_size_t length) const {
        bool success = false;
        if (isValidRegion(address, length)) {
            memcpy(data, this->data_ + address, length);
            success = true;
        }
        return success;
    }

    virtual bool writeErasePage(const void* _data, flash_addr_t address, page_size_t length) {
        bool success = false;
        const uint8_t* data = as_bytes(_data);
        if (!(address & 1) && !(length & 1) && isValidRegion(address, length)) {
            for (; length-- > 0;) {
                this->data_[address++] = *data++;
            }
            success = true;
        }
        return success;
    }

    virtual bool copyPage(flash_addr_t address, TransferHandler handler, void* data, uint8_t* buf, page_size_t bufSize) {
        return false;
    }
};

#define SECTOR_SIZE 512

FakeFlashDevice dev(512, SECTOR_SIZE);
FlashDevice* flash = & dev;
uint16_t block;


bool Sd2Card::readData(uint8_t *dst) {
    return readBlock(block++, dst);
}
bool Sd2Card::readStart(uint32_t blockNumber) {
    block = blockNumber;
    return true;
}
bool Sd2Card::readStop() {
    block = -1;
    return true;
}

bool Sd2Card::readBlock(uint32_t block, uint8_t* dst) {
    return flash->read(dst, block*SECTOR_SIZE, SECTOR_SIZE);
}

bool Sd2Card::writeBlock(uint32_t blockNumber, const uint8_t* src) {
    return flash->write(src, blockNumber*SECTOR_SIZE, SECTOR_SIZE);
}
bool Sd2Card::writeData(const uint8_t* src) {
    return writeBlock(block++, src);
}
bool Sd2Card::writeStart(uint32_t blockNumber, uint32_t eraseCount) {
    block = blockNumber;
    return true;
}
bool Sd2Card::writeStop() {
    block = -1;
    return true;
}

size_t Print::print(unsigned int value, int radix) {
    
}

size_t Print::println() {
    
}

size_t Print::print(unsigned char c, int count) {
    
}

size_t Print::print(int a, int b) {
    
}

size_t Print::println(int a, int b) {
    
}


size_t Print::print(const char c[]) {
    
}

size_t Print::println(const char c[]) {
    
}

size_t Print::write(unsigned char const* c, unsigned int len) {
    
}

class NoOpPrint : public Print {
public:
    size_t write(uint8_t data) {}
};

NoOpPrint _mySerial;
Print& Serial = _mySerial;