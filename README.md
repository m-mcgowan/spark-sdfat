
Current status:

 * Removed Sd2Card functionality via a NO_SDCARD define so that I can focus on the 
   FAT filesystem code, which is mainly hardware-independent. A small header, Arduino.h was added to emulate
   any missing pieces that the library expects from the Arduino SDK.

 * The code targets standard GCC. To make this compile, I've copied verbatim the
   Stream, Print, String classes from the Spark firmware, and also the FakeFlashDevice
   from flashee.  When the code is later targeted to the spark, these classes can be
   removed and included and the appropriate header files included from the core-firmware / flashee library.

 * Reduced Sd2Card interface to the minimum functionality actually required by the FAT system. 
   The original code exposes many methods, but only a subset of these are required and used by the FAT code.

 * Coded a minimum implementation of Sd2Card against the flashee FlashDevice (specifically the FakeFlashDevice)
   so I can start writing tests. 

Planned features:

 * FAT format - the library assumes the backing device is already formatted. To allow this
   to be used with arbitrary block devices, the intitial filesystem structures need
   to be created (boot sector, FAT table and root directory, etc..)
