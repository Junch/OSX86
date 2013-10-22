/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20110112-32 [Jan 13 2011]
 * Copyright (c) 2000 - 2011 Intel Corporation
 * 
 * Disassembly of ./dsdt.aml, Tue Oct 22 10:58:09 2013
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008240 (33344)
 *     Revision         0x02
 *     Checksum         0x18
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20110112 (537985298)
 */

DefinitionBlock ("./dsdt.aml", "DSDT", 2, "ALASKA", "A M I", 0x00000000)
{
    Name (SP1O, 0x2E)
    Name (IO1B, Zero)
    Name (IO1L, Zero)
    Name (IO2B, Zero)
    Name (IO2L, Zero)
    Name (IO3B, 0x0290)
    Name (IO3L, 0x10)
    Name (IOES, Zero)
    Name (WKTP, Zero)
    Name (SPIO, 0x2E)
    Name (IOHW, 0x0290)
    Name (IOSB, Zero)
    Name (IOSL, 0x10)
    Name (IOHB, 0x0290)
    Name (IOHL, 0x10)
    Name (TCBR, 0xFED08000)
    Name (TCLT, 0x1000)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x00100000)
    Name (PM30, 0x0430)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED1F404)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x80)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x04000000)
    Name (LAPB, 0xFEE00000)
    Name (VTDS, 0xFED90000)
    Name (VTDL, 0x4000)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (SHPC, Zero)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (AMWV, 0x09)
    Name (SMIT, 0xB2)
    Name (OFST, 0x35)
    Name (TPMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (SMBS, Zero)
    Name (SMBL, Zero)
    Name (PEHP, Zero)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8)
        }

        Store (One, OSVR)
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Linux"))
            {
                Store (0x03, OSVR)
            }

            If (_OSI ("Windows 2001"))
            {
                Store (0x04, OSVR)
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x05, OSVR)
            }

            If (_OSI ("FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (_OSI ("HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (_OSI ("OpenVMS"))
            {
                Store (0x08, OSVR)
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x09, OSVR)
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x0A, OSVR)
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                Store (0x0B, OSVR)
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x0C, OSVR)
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                Store (0x0D, OSVR)
            }

            If (_OSI ("Windows 2009"))
            {
                Store (0x0E, OSVR)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (Zero, OSVR)
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                Store (One, OSVR)
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x02, OSVR)
            }

            If (MCTH (_OS, "Linux"))
            {
                Store (0x03, OSVR)
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (MCTH (_OS, "HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                Store (0x08, OSVR)
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, One)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, One)
    Name (TOPM, Zero)
    Name (ROMS, 0xFFE00000)
    Scope (_SB)
    {
        Name (PR00, Package (0x15)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKH, 
                Zero
            }
        })
        Name (AR00, Package (0x15)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }
        })
        Name (PR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR18, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR18, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR24, Package (0x10)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR24, Package (0x10)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Name (PRSC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,10,11,12,14,15}
        })
        Alias (PRSC, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_UID, Zero)
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)
            {
                Return (BN00 ())
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Method (_S3D, 0, NotSerialized)
            {
                If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Device (MCH)
            {
                Name (_HID, EisaId ("PNP0C01"))
                Name (_UID, 0x0A)
                Name (MCHR, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFED10000,         // Address Base
                        0x0000A000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x1FE00000,         // Address Length
                        _Y00)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y01)
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00010000,         // Address Length
                        )
                })
                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (MCHR, \_SB.PCI0.MCH._Y00._BAS, PCIB)
                    CreateDWordField (MCHR, \_SB.PCI0.MCH._Y00._LEN, PCIL)
                    If (LNotEqual (PEXB, Zero))
                    {
                        Store (PEXB, PCIB)
                        Store (PEXL, PCIL)
                    }
                    Else
                    {
                        Store (PEBS, PCIB)
                        Store (PELN, PCIL)
                    }

                    CreateDWordField (MCHR, \_SB.PCI0.MCH._Y01._BAS, VTCB)
                    CreateDWordField (MCHR, \_SB.PCI0.MCH._Y01._LEN, VTCL)
                    If (LNotEqual (VTDB, Zero))
                    {
                        Store (VTDB, VTCB)
                        Store (VTLN, VTCL)
                    }
                    Else
                    {
                        Store (VTDS, VTCB)
                        Store (VTDL, VTCL)
                    }

                    Return (MCHR)
                }
            }

            OperationRegion (NBNV, SystemMemory, 0xDF5C4D98, 0x0100)
            Field (NBNV, AnyAcc, Lock, Preserve)
            {
                NBSG,   32, 
                        Offset (0x10), 
                PEXB,   32, 
                PEXL,   32, 
                MCHB,   32, 
                MCHL,   32, 
                VTDB,   32, 
                VTLN,   32
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Name (CPRB, One)
            Name (STAV, 0x0F)
            Name (BRB, Zero)
            Name (BRL, 0x0100)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0xE4000000)
            Name (MBL, 0x1C000000)
            Name (MABL, Zero)
            Name (MABH, Zero)
            Name (MALL, Zero)
            Name (MALH, Zero)
            Name (MAML, Zero)
            Name (MAMH, Zero)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y02)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y03, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00018000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFFDFFFFE,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000002,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000001, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, _Y07, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000001, // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (STAV)
            }

            Method (_CRS, 0, NotSerialized)
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, MIN0)
                    CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, MAX0)
                    CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, LEN0)
                    Store (BRB, MIN0)
                    Store (BRL, LEN0)
                    Store (LEN0, Local0)
                    Add (MIN0, Decrement (Local0), MAX0)
                    CreateWordField (CRS1, \_SB.PCI0._Y03._MIN, MIN1)
                    CreateWordField (CRS1, \_SB.PCI0._Y03._MAX, MAX1)
                    CreateWordField (CRS1, \_SB.PCI0._Y03._LEN, LEN1)
                    If (LEqual (IOB, 0x1000))
                    {
                        Store (IOL, Local0)
                        Add (IOB, Decrement (Local0), MAX1)
                        Subtract (MAX1, MIN1, Local0)
                        Add (Local0, One, LEN1)
                    }
                    Else
                    {
                        Store (IOB, MIN1)
                        Store (IOL, LEN1)
                        Store (LEN1, Local0)
                        Add (MIN1, Decrement (Local0), MAX1)
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)
                    Store (MBB, MIN3)
                    Store (MBL, LEN3)
                    Store (LEN3, Local0)
                    Add (MIN3, Decrement (Local0), MAX3)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)
                        Add (0x94, 0x04, Local0)
                        CreateDWordField (CRS1, Local0, MN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)
                        Add (0x9C, 0x04, Local1)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)
                        Add (0xAC, 0x04, Local2)
                        CreateDWordField (CRS1, Local2, LN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        Store (MALL, LN8L)
                        Store (MALH, LN8H)
                        Store (MAML, MX8L)
                        Store (MAMH, MX8H)
                    }

                    Return (CRS1)
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)
                    Store (BRB, MIN2)
                    Store (BRL, LEN2)
                    Store (LEN2, Local1)
                    Add (MIN2, Decrement (Local1), MAX2)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)
                    Store (IOB, MIN4)
                    Store (IOL, LEN4)
                    Store (LEN4, Local1)
                    Add (MIN4, Decrement (Local1), MAX4)
                    CreateDWordField (CRS2, \_SB.PCI0._Y08._MIN, MIN5)
                    CreateDWordField (CRS2, \_SB.PCI0._Y08._MAX, MAX5)
                    CreateDWordField (CRS2, \_SB.PCI0._Y08._LEN, LEN5)
                    Store (MBB, MIN5)
                    Store (MBL, LEN5)
                    Store (LEN5, Local1)
                    Add (MIN5, Decrement (Local1), MAX5)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, MN9L)
                        Add (0x48, 0x04, Local0)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, MX9L)
                        Add (0x50, 0x04, Local1)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, LN9L)
                        Add (0x60, 0x04, Local2)
                        CreateDWordField (CRS2, Local2, LN9H)
                        Store (MABL, MN9L)
                        Store (MABH, MN9H)
                        Store (MALL, LN9L)
                        Store (MALH, LN9H)
                        Store (MAML, MX9L)
                        Store (MAMH, MX9H)
                    }

                    Return (CRS2)
                }
            }

            Method (_OSC, 4, NotSerialized)
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */    0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40, 
                            /* 0008 */    0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (PEHP))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (SHPC))
                    {
                        And (CTRL, 0x1D, CTRL)
                    }

                    If (LNot (PEPM))
                    {
                        And (CTRL, 0x1B, CTRL)
                    }

                    If (LNot (PEER))
                    {
                        And (CTRL, 0x15, CTRL)
                    }

                    If (LNot (PECS))
                    {
                        And (CTRL, 0x0F, CTRL)
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x001F0000)
                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, PS1S)
                    Store (One, PS1E)
                    Store (One, SLPS)
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, SLPS)
                    Store (Zero, PS1E)
                    If (RTCS) {}
                    Else
                    {
                        Notify (PWRB, 0x02)
                    }
                }

                OperationRegion (APMP, SystemIO, SMIP, 0x02)
                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                    APMC,   8, 
                    APMS,   8
                }

                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x01), 
                        ,   1, 
                    BRTC,   1
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                            Offset (0x08)
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                    OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                    Field (PMS0, ByteAcc, NoLock, Preserve)
                    {
                            ,   10, 
                        RTCS,   1, 
                            ,   3, 
                        PEXS,   1, 
                        WAKS,   1, 
                                Offset (0x03), 
                        PWBT,   1, 
                                Offset (0x04)
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LNotEqual (SUSW, 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PRW, 0, NotSerialized)
                        {
                            If (LNotEqual (SUSW, 0xFF))
                            {
                                Return (Package (0x02)
                                {
                                    SUSW, 
                                    0x04
                                })
                            }
                            Else
                            {
                                Return (Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (PCH)
                        {
                            Name (_HID, EisaId ("PNP0C01"))
                            Name (_UID, 0x01C7)
                            Name (_STA, 0x0F)
                            Name (ICHR, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0A)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0B)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0C)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0D)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y0F)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y0E)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y10)
                                Memory32Fixed (ReadWrite,
                                    0xFF000000,         // Address Base
                                    0x01000000,         // Address Length
                                    )
                            })
                            Method (_CRS, 0, NotSerialized)
                            {
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0A._MIN, PBB)
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0A._MAX, PBH)
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0A._LEN, PML)
                                Store (PMBS, PBB)
                                Store (PMBS, PBH)
                                Store (0x54, PML)
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0B._MIN, P2B)
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0B._MAX, P2H)
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0B._LEN, P2L)
                                Add (PMBS, 0x58, P2B)
                                Add (PMBS, 0x58, P2H)
                                Store (0x28, P2L)
                                If (SMBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y0C._MIN, SMB)
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y0C._MAX, SMH)
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y0C._LEN, SML)
                                    Store (SMBS, SMB)
                                    Store (SMBS, SMH)
                                    Store (SMBL, SML)
                                }

                                If (GPBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y0D._MIN, IGB)
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y0D._MAX, IGH)
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y0D._LEN, IGL)
                                    Store (GPBS, IGB)
                                    Store (GPBS, IGH)
                                    Store (GPLN, IGL)
                                }

                                If (APCB)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y0E._BAS, APB)
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y0E._LEN, APL)
                                    Store (APCB, APB)
                                    Store (APCL, APL)
                                }

                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y0F._BAS, RCB)
                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y0F._LEN, RCL)
                                Store (SRCB, RCB)
                                Store (SRCL, RCL)
                                If (TCBR)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y10._BAS, TCB)
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y10._LEN, TCL)
                                    Store (TCBR, TCB)
                                    Store (TCLT, TCL)
                                }

                                Return (ICHR)
                            }
                        }

                        Device (CWDT)
                        {
                            Name (_HID, EisaId ("INT3F0D"))
                            Name (_CID, EisaId ("PNP0C02"))
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0454,             // Range Minimum
                                    0x0454,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    _Y11)
                            })
                            Method (_STA, 0, Serialized)
                            {
                                Return (0x0F)
                            }

                            Method (_CRS, 0, Serialized)
                            {
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y11._MIN, WDB)
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y11._MAX, WDH)
                                Add (PMBS, 0x54, WDB)
                                Add (PMBS, 0x54, WDH)
                                Return (BUF0)
                            }
                        }
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            _Y12)
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            _Y13)
                    })
                    CreateWordField (_CRS, \_SB.PCI0.SBRG.EC0._Y12._MIN, DPRT)
                    CreateWordField (_CRS, \_SB.PCI0.SBRG.EC0._Y13._MIN, CPRT)
                    Name (_GPE, 0x18)
                    Name (REGC, Zero)
                    Method (_Q80, 0, NotSerialized)
                    {
                        \AMW0.AMWN (0x05)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        \AMW0.AMWN (0x00010005)
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        \AMW0.AMWN (0x00020005)
                    }

                    Method (_Q83, 0, NotSerialized)
                    {
                        \AMW0.AMWN (0x00030005)
                    }
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x0111)
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y14)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y15)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y16)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y17)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LAnd (LLess (SP1O, 0x03F0), LGreater (SP1O, 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y14._MIN, GPI0)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y14._MAX, GPI1)
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y14._LEN, GPIL)
                            Store (SP1O, GPI0)
                            Store (SP1O, GPI1)
                            Store (0x02, GPIL)
                        }

                        If (IO1B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._MIN, GP10)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._MAX, GP11)
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._LEN, GPL1)
                            Store (IO1B, GP10)
                            Store (IO1B, GP11)
                            Store (IO1L, GPL1)
                        }

                        If (IO3B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MIN, GP20)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MAX, GP21)
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._LEN, GPL2)
                            Store (IO3B, GP20)
                            Store (IO3B, GP21)
                            Store (IO3L, GPL2)
                        }

                        If (IO2B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MIN, GP30)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MAX, GP31)
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._LEN, GPL3)
                            Store (IO2B, GP30)
                            Store (IO2B, GP31)
                            Store (IO2L, GPL3)
                        }

                        Return (CRS)
                    }

                    Name (DCAT, Package (0x15)
                    {
                        0x02, 
                        0x03, 
                        One, 
                        Zero, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x06, 
                        0xFF, 
                        0xFF
                    })
                    Mutex (MUT0, 0x00)
                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (MUT0, 0xFFFF)
                        Store (0x87, INDX)
                        Store (0x87, INDX)
                        Store (Arg0, LDN)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                        Release (MUT0)
                    }

                    Method (LPTM, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT0, 0x02, Local0)
                        EXFG ()
                        Return (Local0)
                    }

                    Method (UHID, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT0, 0x38, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                        Else
                        {
                            Return (0x0105D041)
                        }
                    }

                    OperationRegion (IOID, SystemIO, SP1O, 0x02)
                    Field (IOID, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x21), 
                        SCF1,   8, 
                        SCF2,   8, 
                        SCF3,   8, 
                        SCF4,   8, 
                        SCF5,   8, 
                        SCF6,   8, 
                                Offset (0x29), 
                        CKCF,   8, 
                                Offset (0x30), 
                        ACTR,   8, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IOH2,   8, 
                        IOL2,   8, 
                                Offset (0x70), 
                        INTR,   8, 
                                Offset (0x74), 
                        DMCH,   8, 
                                Offset (0xE0), 
                        RGE0,   8, 
                        RGE1,   8, 
                        RGE2,   8, 
                        RGE3,   8, 
                        RGE4,   8, 
                        RGE5,   8, 
                        RGE6,   8, 
                        RGE7,   8, 
                        RGE8,   8, 
                        RGE9,   8, 
                                Offset (0xF0), 
                        OPT0,   8, 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8, 
                        OPT5,   8, 
                        OPT6,   8, 
                        OPT7,   8, 
                        OPT8,   8, 
                        OPT9,   8
                    }

                    Method (CGLD, 1, NotSerialized)
                    {
                        Return (DerefOf (Index (DCAT, Arg0)))
                    }

                    Method (DSTA, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Store (ACTR, Local0)
                        EXFG ()
                        If (LEqual (Local0, 0xFF))
                        {
                            Return (Zero)
                        }

                        And (Local0, One, Local0)
                        If (LGreaterEqual (Arg0, 0x10))
                        {
                            Or (IOES, ShiftLeft (Local0, And (Arg0, 0x0F)), IOES)
                        }
                        Else
                        {
                            Or (IOST, ShiftLeft (Local0, Arg0), IOST)
                        }

                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LGreaterEqual (Arg0, 0x10))
                            {
                                Store (IOES, Local0)
                            }
                            Else
                            {
                                Store (IOST, Local0)
                            }

                            And (Arg0, 0x0F, Local1)
                            If (And (ShiftLeft (One, Local1), Local0))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Method (DCNT, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        If (LAnd (LLess (DMCH, 0x04), LNotEqual (And (DMCH, 0x03, 
                            Local1), Zero)))
                        {
                            RDMA (Arg0, Arg1, Increment (Local1))
                        }

                        Store (Arg1, ACTR)
                        ShiftLeft (IOAH, 0x08, Local1)
                        Or (IOAL, Local1, Local1)
                        RRIO (Arg0, Arg1, Local1, 0x08)
                        EXFG ()
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1A)
                        IRQNoFlags (_Y18)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y19)
                            {}
                    })
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y18._INT, IRQM)
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y19._DMA, DMAM)
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MIN, IO11)
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MAX, IO12)
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._LEN, LEN1)
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1D)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1E)
                        IRQNoFlags (_Y1B)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1C)
                            {2}
                    })
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1B._INT, IRQE)
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1C._DMA, DMAE)
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MIN, IO21)
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MAX, IO22)
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._LEN, LEN2)
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MIN, IO31)
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MAX, IO32)
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._LEN, LEN3)
                    Name (CRS4, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y20)
                        IRQ (Edge, ActiveLow, Shared, _Y1F)
                            {}
                    })
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y1F._INT, IRQL)
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MIN, IOHL)
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MAX, IORL)
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._ALN, ALMN)
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._LEN, LENG)
                    Method (DCRS, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IO11)
                        Or (IOAL, IO11, IO11)
                        Store (IO11, IO12)
                        Store (0x08, LEN1)
                        If (INTR)
                        {
                            ShiftLeft (One, INTR, IRQM)
                        }
                        Else
                        {
                            Store (Zero, IRQM)
                        }

                        If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                        {
                            Store (Zero, DMAM)
                        }
                        Else
                        {
                            And (DMCH, 0x03, Local1)
                            ShiftLeft (One, Local1, DMAM)
                        }

                        EXFG ()
                        Return (CRS1)
                    }

                    Method (DCR2, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IO21)
                        Or (IOAL, IO21, IO21)
                        Store (IO21, IO22)
                        Store (0x08, LEN2)
                        ShiftLeft (IOH2, 0x08, IO31)
                        Or (IOL2, IO31, IO31)
                        Store (IO21, IO32)
                        Store (0x08, LEN3)
                        If (INTR)
                        {
                            ShiftLeft (One, INTR, IRQE)
                        }
                        Else
                        {
                            Store (Zero, IRQE)
                        }

                        If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                        {
                            Store (Zero, DMAE)
                        }
                        Else
                        {
                            And (DMCH, 0x03, Local1)
                            ShiftLeft (One, Local1, DMAE)
                        }

                        EXFG ()
                        Return (CRS2)
                    }

                    Method (DCR4, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IOHL)
                        Or (IOAL, IOHL, IOHL)
                        Store (IOHL, IORL)
                        Store (0x08, LENG)
                        If (INTR)
                        {
                            And (INTR, 0x0F, INTR)
                            ShiftLeft (One, INTR, IRQL)
                        }
                        Else
                        {
                            Store (Zero, IRQL)
                        }

                        EXFG ()
                        Return (CRS4)
                    }

                    Method (DSRS, 2, NotSerialized)
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            If (LPTM (CGLD (Arg1)))
                            {
                                DSR2 (Arg0, Arg1)
                            }
                        }
                        Else
                        {
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateByteField (Arg0, 0x0C, DMAM)
                            CreateWordField (Arg0, 0x02, IO11)
                            ENFG (CGLD (Arg1))
                            ShiftLeft (IOAH, 0x08, Local1)
                            Or (IOAL, Local1, Local1)
                            RRIO (Arg1, Zero, Local1, 0x08)
                            RRIO (Arg1, One, IO11, 0x08)
                            And (IO11, 0xFF, IOAL)
                            ShiftRight (IO11, 0x08, IOAH)
                            If (IRQM)
                            {
                                FindSetRightBit (IRQM, Local0)
                                Subtract (Local0, One, INTR)
                            }
                            Else
                            {
                                Store (Zero, INTR)
                            }

                            If (DMAM)
                            {
                                FindSetRightBit (DMAM, Local0)
                                Subtract (Local0, One, DMCH)
                            }
                            Else
                            {
                                Store (0x04, DMCH)
                            }

                            EXFG ()
                            DCNT (Arg1, One)
                            Store (Arg1, Local2)
                            If (LGreater (Local2, Zero))
                            {
                                Subtract (Local2, One, Local2)
                            }
                        }
                    }

                    Method (DSR2, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x11, IRQT)
                        CreateByteField (Arg0, 0x14, DMAT)
                        CreateWordField (Arg0, 0x02, IOT1)
                        CreateWordField (Arg0, 0x0A, IOT2)
                        ENFG (CGLD (Arg1))
                        And (IOT1, 0xFF, IOAL)
                        ShiftRight (IOT1, 0x08, IOAH)
                        And (IOT2, 0xFF, IOL2)
                        ShiftRight (IOT2, 0x08, IOH2)
                        If (IRQT)
                        {
                            FindSetRightBit (IRQT, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        If (DMAT)
                        {
                            FindSetRightBit (DMAT, Local0)
                            Subtract (Local0, One, DMCH)
                        }
                        Else
                        {
                            Store (0x04, DMCH)
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Store (Arg1, Local2)
                        If (LGreater (Local2, Zero))
                        {
                            Subtract (Local2, One, Local2)
                        }
                    }

                    Method (DSR4, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, IOHL)
                        CreateWordField (Arg0, 0x09, IRQL)
                        ENFG (CGLD (Arg1))
                        And (IOHL, 0xFF, IOAL)
                        ShiftRight (IOHL, 0x08, IOAH)
                        If (IRQL)
                        {
                            FindSetRightBit (IRQL, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Store (Arg1, Local2)
                        If (LGreater (Local2, Zero))
                        {
                            Subtract (Local2, One, Local2)
                        }
                    }
                }

                Name (PMFG, Zero)
                Method (SIOS, 1, NotSerialized)
                {
                    Store ("SIOS", Debug)
                    If (LEqual (One, Arg0))
                    {
                        ^SIO1.ENFG (0x0A)
                        And (^SIO1.RGE0, 0x9F, ^SIO1.RGE0)
                        If (KBFG)
                        {
                            Or (^SIO1.OPT6, 0x10, ^SIO1.OPT6)
                        }
                        Else
                        {
                            And (^SIO1.OPT6, 0xEF, ^SIO1.OPT6)
                        }

                        If (MSFG)
                        {
                            Or (^SIO1.OPT6, 0x20, ^SIO1.OPT6)
                        }
                        Else
                        {
                            And (^SIO1.OPT6, 0xDF, ^SIO1.OPT6)
                        }

                        Store (0xFF, ^SIO1.OPT3)
                        Store (0xFF, ^SIO1.OPT4)
                        Or (One, ^SIO1.OPT2, ^SIO1.OPT2)
                        ^SIO1.EXFG ()
                        Return (Zero)
                    }

                    If (LNotEqual (0x05, Arg0))
                    {
                        ^SIO1.ENFG (0x0A)
                        Store (0xFF, ^SIO1.OPT3)
                        Store (0xFF, ^SIO1.OPT4)
                        Store (^SIO1.RGE3, Local0)
                        If (KBFG)
                        {
                            Or (^SIO1.RGE0, 0x41, ^SIO1.RGE0)
                        }
                        Else
                        {
                            And (^SIO1.RGE0, 0xBF, ^SIO1.RGE0)
                        }

                        If (MSFG)
                        {
                            Or (^SIO1.RGE0, 0x22, ^SIO1.RGE0)
                            And (^SIO1.RGE0, 0xFD, ^SIO1.RGE0)
                            Or (^SIO1.RGE6, 0x80, ^SIO1.RGE6)
                        }
                        Else
                        {
                            And (^SIO1.RGE0, 0xDF, ^SIO1.RGE0)
                        }

                        And (0xFE, ^SIO1.OPT2, ^SIO1.OPT2)
                        ^SIO1.EXFG ()
                    }
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Store ("SIOW", Debug)
                    ^SIO1.ENFG (0x0A)
                    Store (^SIO1.OPT3, PMFG)
                    Store (0xFF, ^SIO1.OPT3)
                    And (^SIO1.OPT0, 0xE7, ^SIO1.OPT0)
                    And (0xFE, ^SIO1.OPT2, ^SIO1.OPT2)
                    ^SIO1.EXFG ()
                }

                OperationRegion (RX80, PCI_Config, Zero, 0xFF)
                Field (RX80, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x80), 
                    LPCD,   16, 
                    LPCE,   16
                }

                Name (DBPT, Package (0x04)
                {
                    Package (0x08)
                    {
                        0x03F8, 
                        0x02F8, 
                        0x0220, 
                        0x0228, 
                        0x0238, 
                        0x02E8, 
                        0x0338, 
                        0x03E8
                    }, 

                    Package (0x08)
                    {
                        0x03F8, 
                        0x02F8, 
                        0x0220, 
                        0x0228, 
                        0x0238, 
                        0x02E8, 
                        0x0338, 
                        0x03E8
                    }, 

                    Package (0x03)
                    {
                        0x0378, 
                        0x0278, 
                        0x03BC
                    }, 

                    Package (0x02)
                    {
                        0x03F0, 
                        0x0370
                    }
                })
                Name (DDLT, Package (0x04)
                {
                    Package (0x02)
                    {
                        Zero, 
                        0xFFF8
                    }, 

                    Package (0x02)
                    {
                        0x04, 
                        0xFF8F
                    }, 

                    Package (0x02)
                    {
                        0x08, 
                        0xFCFF
                    }, 

                    Package (0x02)
                    {
                        0x0C, 
                        0xEFFF
                    }
                })
                Method (RRIO, 4, NotSerialized)
                {
                    If (LAnd (LLessEqual (Arg0, 0x03), LGreaterEqual (Arg0, Zero)))
                    {
                        Store (Match (DerefOf (Index (DBPT, Arg0)), MEQ, Arg2, MTR, 
                            Zero, Zero), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (DerefOf (Index (DerefOf (Index (DDLT, Arg0)), Zero)), 
                                Local1)
                            Store (DerefOf (Index (DerefOf (Index (DDLT, Arg0)), One)), 
                                Local2)
                            ShiftLeft (Local0, Local1, Local0)
                            And (LPCD, Local2, LPCD)
                            Or (LPCD, Local0, LPCD)
                            WX82 (Arg0, Arg1)
                        }
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        If (LEqual (Arg2, 0x0200))
                        {
                            WX82 (0x08, Arg0)
                        }
                        Else
                        {
                            If (LEqual (Arg2, 0x0208))
                            {
                                WX82 (0x09, Arg0)
                            }
                        }
                    }

                    If (LAnd (LLessEqual (Arg0, 0x0D), LGreaterEqual (Arg0, 0x0A)))
                    {
                        WX82 (Arg0, Arg1)
                    }
                }

                Method (WX82, 2, NotSerialized)
                {
                    ShiftLeft (One, Arg0, Local0)
                    If (Arg1)
                    {
                        Or (LPCE, Local0, LPCE)
                    }
                    Else
                    {
                        Not (Local0, Local0)
                        And (LPCE, Local0, LPCE)
                    }
                }

                Method (RDMA, 3, NotSerialized)
                {
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x10)
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x00,               // Alignment
                            0x09,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (CRS)
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CID, EisaId ("PNP030B"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Store (Arg0, KBFG)
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Method (PS2K._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x1D, 0x04))
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))
                    Name (_CID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (IOST, 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Store (Arg0, MSFG)
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Method (PS2M._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x1D, 0x04))
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Name (_UID, One)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (^^SIO1.DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ^^SIO1.DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (^^SIO1.DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        ^^SIO1.DSRS (Arg0, Zero)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR1._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x08, 0x04))
                }
            }

            Device (BR20)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0000)
                Name (_S4D, 0x02)
                Name (_S3D, 0x02)
                Name (_S2D, 0x02)
                Name (_S1D, 0x02)
                Device (HUBN)
                {
                    Name (_ADR, Zero)
                    Device (PR10)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x10)
                        {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Device (PR30)
                        {
                            Name (_ADR, One)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1C, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (P0P3)
            {
                Name (_ADR, 0x00010002)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }
            }

            Device (P0P4)
            {
                Name (_ADR, 0x00060000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x00010000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (P0P2)
            {
                Name (_ADR, 0x00010001)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        0x05
                    })
                }

                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x04)
                        {
                            "layout-id", 
                            Buffer (0x04)
                            {
                                0x7C, 0x03, 0x00, 0x00
                            }, 

                            "PinConfigurations", 
                            Buffer (Zero) {}
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR11)
                    }

                    Return (PR11)
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR12)
                    }

                    Return (PR12)
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR13)
                    }

                    Return (PR13)
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR14)
                    }

                    Return (PR14)
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR15)
                    }

                    Return (PR15)
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR16)
                    }

                    Return (PR16)
                }
            }

            Device (PEX6)
            {
                Name (_ADR, 0x001C0006)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR17)
                    }

                    Return (PR17)
                }

                Device (BR24)
                {
                    Name (_ADR, Zero)
                    Method (_PRW, 0, NotSerialized)
                    {
                        Return (GPRW (0x0B, 0x04))
                    }

                    Method (_PRT, 0, NotSerialized)
                    {
                        If (PICM)
                        {
                            Return (AR24)
                        }

                        Return (PR24)
                    }
                }
            }

            Device (PEX7)
            {
                Name (_ADR, 0x001C0007)
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x60), 
                            Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                            Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    Store (One, PMS)
                    Store (One, PCS)
                    Store (One, PMS)
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    Store (One, PCE)
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    Store (Zero, PCE)
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR18)
                    }

                    Return (PR18)
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)
                Name (^NATA, Package (0x01)
                {
                    0x001F0002
                })
                Name (\FZTF, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                            Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                            Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                            Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                            Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                            Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                            Offset (0x0C), 
                            Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        ShiftLeft (PSCR, One, Local1)
                        Or (PMCR, Local1, Local0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local1)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local2)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local0)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local1)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (PMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (PMUT, GMUT)
                        Store (PMCR, GMCR)
                        Store (PSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (PSUT, GSUT)
                        Store (PSCR, GSCR)
                        STM ()
                        Store (GMPT, PMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, PMUT)
                        Store (GMCR, PMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, PSUT)
                        Store (GSCR, PSCR)
                        If (And (Local0, One))
                        {
                            Store (One, PM3E)
                        }
                        Else
                        {
                            Store (Zero, PM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, PM6E)
                        }
                        Else
                        {
                            Store (Zero, PM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, PMAE)
                        }
                        Else
                        {
                            Store (Zero, PMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, PS3E)
                        }
                        Else
                        {
                            Store (Zero, PS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, PS6E)
                        }
                        Else
                        {
                            Store (Zero, PS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, PSAE)
                        }
                        Else
                        {
                            Store (Zero, PSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA0)
                        Store (GTF (One, Arg2), ATA1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        ShiftLeft (SSCR, One, Local1)
                        Or (SMCR, Local1, Local0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local1)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local2)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local0)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local1)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (SMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (SMUT, GMUT)
                        Store (SMCR, GMCR)
                        Store (SSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (SSUT, GSUT)
                        Store (SSCR, GSCR)
                        STM ()
                        Store (GMPT, SMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, SMUT)
                        Store (GMCR, SMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, SSUT)
                        Store (GSCR, SSCR)
                        If (And (Local0, One))
                        {
                            Store (One, SM3E)
                        }
                        Else
                        {
                            Store (Zero, SM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, SM6E)
                        }
                        Else
                        {
                            Store (Zero, SM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, SMAE)
                        }
                        Else
                        {
                            Store (Zero, SMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, SS3E)
                        }
                        Else
                        {
                            Store (Zero, SS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, SS6E)
                        }
                        Else
                        {
                            Store (Zero, SS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, SSAE)
                        }
                        Else
                        {
                            Store (Zero, SSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA2)
                        Store (GTF (One, Arg2), ATA3)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    Store (Ones, PIO0)
                    Store (Ones, PIO1)
                    Store (Ones, DMA0)
                    Store (Ones, DMA1)
                    Store (0x10, CHNF)
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0)
                    }

                    If (And (Arg1, 0x20))
                    {
                        Or (CHNF, 0x02, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA0)
                    Store (Local7, PIO0)
                    If (And (Arg4, 0x20))
                    {
                        Or (CHNF, 0x08, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA1)
                    Store (Local7, PIO1)
                    If (And (Arg1, 0x07))
                    {
                        Store (Arg2, Local5)
                        If (And (Arg1, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg1, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA0)
                        Or (CHNF, One, CHNF)
                    }

                    If (And (Arg4, 0x07))
                    {
                        Store (Arg5, Local5)
                        If (And (Arg4, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg4, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA1)
                        Or (CHNF, 0x04, CHNF)
                    }

                    Store (TMD0, Debug)
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        Store (Zero, GMUE)
                        Store (Zero, GMUT)
                        Store (Zero, GSUE)
                        Store (Zero, GSUT)
                        If (And (CHNF, One))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GMUT)
                            Or (GMUE, One, GMUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GMUE, 0x02, GMUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GMUE, 0xFD, GMUE)
                                Or (GMUE, 0x04, GMUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO0, Ones), LEqual (PIO0, Zero)))
                            {
                                If (And (LLess (DMA0, Ones), LGreater (DMA0, Zero)))
                                {
                                    Store (DMA0, PIO0)
                                    Or (GMUE, 0x80, GMUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x04))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GSUT)
                            Or (GSUE, One, GSUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GSUE, 0x02, GSUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GSUE, 0xFD, GSUE)
                                Or (GSUE, 0x04, GSUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO1, Ones), LEqual (PIO1, Zero)))
                            {
                                If (And (LLess (DMA1, Ones), LGreater (DMA1, Zero)))
                                {
                                    Store (DMA1, PIO1)
                                    Or (GSUE, 0x80, GSUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x02))
                        {
                            Or (GMUE, 0x20, GMUE)
                        }

                        If (And (CHNF, 0x08))
                        {
                            Or (GSUE, 0x20, GSUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                            Local1)
                        Store (Local1, GMPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GMUE, 0x50, GMUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Store (Local1, GSPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GSUE, 0x50, GSUE)
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                    0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT03, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT04, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    Add (Local0, 0x08, Local1)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, 0x02, Local0), A001)
                    CreateByteField (ATAB, Add (Local0, 0x06), A005)
                    Store (Arg0, CMDX)
                    Store (Arg1, A001)
                    Store (Arg2, A005)
                    Increment (CMDC)
                }

                Method (GTF, 2, Serialized)
                {
                    Store (Arg1, Debug)
                    Store (Zero, CMDC)
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        Store (IW49, ID49)
                        CreateWordField (Arg1, 0x6A, IW53)
                        Store (IW53, ID53)
                        CreateWordField (Arg1, 0x7E, IW63)
                        Store (IW63, ID63)
                        CreateWordField (Arg1, 0x76, IW59)
                        Store (IW59, ID59)
                        CreateWordField (Arg1, 0xB0, IW88)
                        Store (IW88, ID88)
                    }

                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                        And (CHNF, 0x08, IRDY)
                        If (And (CHNF, 0x10))
                        {
                            Store (PIO1, PIOT)
                        }
                        Else
                        {
                            Store (PIO0, PIOT)
                        }

                        If (And (CHNF, 0x04))
                        {
                            If (And (CHNF, 0x10))
                            {
                                Store (DMA1, DMAT)
                            }
                            Else
                            {
                                Store (DMA0, DMAT)
                            }
                        }
                    }
                    Else
                    {
                        And (CHNF, 0x02, IRDY)
                        Store (PIO0, PIOT)
                        If (And (CHNF, One))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (LAnd (And (ID53, 0x04), And (ID88, 0xFF00
                        )), DMAT))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, 
                            Zero, Zero), Local1)
                        If (LGreater (Local1, 0x05))
                        {
                            Store (0x05, Local1)
                        }

                        GTFB (AT01, Or (0x40, Local1), Local7)
                    }
                    Else
                    {
                        If (LAnd (And (ID63, 0xFF00), PIOT))
                        {
                            And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                                Zero, Zero), 0x03, Local0)
                            Or (0x20, DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0
                                )), Local1)
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Or (0x08, DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0
                            )), Local1)
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If (And (ID49, 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (LAnd (And (ID59, 0x0100), And (ID59, 0xFF)))
                    {
                        GTFB (AT03, And (ID59, 0xFF), Local7)
                    }

                    Store (ATAB, Debug)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Store (RETB, Debug)
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                            Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                            Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                            Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                            Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                            Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                            Offset (0x0C), 
                            Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        ShiftLeft (PSCR, One, Local1)
                        Or (PMCR, Local1, Local0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local1)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local2)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local0)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local1)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (PMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (PMUT, GMUT)
                        Store (PMCR, GMCR)
                        Store (PSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (PSUT, GSUT)
                        Store (PSCR, GSCR)
                        STM ()
                        Store (GMPT, PMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, PMUT)
                        Store (GMCR, PMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, PSUT)
                        Store (GSCR, PSCR)
                        If (And (Local0, One))
                        {
                            Store (One, PM3E)
                        }
                        Else
                        {
                            Store (Zero, PM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, PM6E)
                        }
                        Else
                        {
                            Store (Zero, PM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, PMAE)
                        }
                        Else
                        {
                            Store (Zero, PMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, PS3E)
                        }
                        Else
                        {
                            Store (Zero, PS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, PS6E)
                        }
                        Else
                        {
                            Store (Zero, PS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, PSAE)
                        }
                        Else
                        {
                            Store (Zero, PSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA0)
                        Store (GTF (One, Arg2), ATA1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        ShiftLeft (SSCR, One, Local1)
                        Or (SMCR, Local1, Local0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local1)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local2)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local0)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local1)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (SMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (SMUT, GMUT)
                        Store (SMCR, GMCR)
                        Store (SSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (SSUT, GSUT)
                        Store (SSCR, GSCR)
                        STM ()
                        Store (GMPT, SMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, SMUT)
                        Store (GMCR, SMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, SSUT)
                        Store (GSCR, SSCR)
                        If (And (Local0, One))
                        {
                            Store (One, SM3E)
                        }
                        Else
                        {
                            Store (Zero, SM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, SM6E)
                        }
                        Else
                        {
                            Store (Zero, SM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, SMAE)
                        }
                        Else
                        {
                            Store (Zero, SMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, SS3E)
                        }
                        Else
                        {
                            Store (Zero, SS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, SS6E)
                        }
                        Else
                        {
                            Store (Zero, SS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, SSAE)
                        }
                        Else
                        {
                            Store (Zero, SSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA2)
                        Store (GTF (One, Arg2), ATA3)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    Store (Ones, PIO0)
                    Store (Ones, PIO1)
                    Store (Ones, DMA0)
                    Store (Ones, DMA1)
                    Store (0x10, CHNF)
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0)
                    }

                    If (And (Arg1, 0x20))
                    {
                        Or (CHNF, 0x02, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA0)
                    Store (Local7, PIO0)
                    If (And (Arg4, 0x20))
                    {
                        Or (CHNF, 0x08, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA1)
                    Store (Local7, PIO1)
                    If (And (Arg1, 0x07))
                    {
                        Store (Arg2, Local5)
                        If (And (Arg1, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg1, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA0)
                        Or (CHNF, One, CHNF)
                    }

                    If (And (Arg4, 0x07))
                    {
                        Store (Arg5, Local5)
                        If (And (Arg4, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg4, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA1)
                        Or (CHNF, 0x04, CHNF)
                    }

                    Store (TMD0, Debug)
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        Store (Zero, GMUE)
                        Store (Zero, GMUT)
                        Store (Zero, GSUE)
                        Store (Zero, GSUT)
                        If (And (CHNF, One))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GMUT)
                            Or (GMUE, One, GMUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GMUE, 0x02, GMUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GMUE, 0xFD, GMUE)
                                Or (GMUE, 0x04, GMUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO0, Ones), LEqual (PIO0, Zero)))
                            {
                                If (And (LLess (DMA0, Ones), LGreater (DMA0, Zero)))
                                {
                                    Store (DMA0, PIO0)
                                    Or (GMUE, 0x80, GMUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x04))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GSUT)
                            Or (GSUE, One, GSUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GSUE, 0x02, GSUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GSUE, 0xFD, GSUE)
                                Or (GSUE, 0x04, GSUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO1, Ones), LEqual (PIO1, Zero)))
                            {
                                If (And (LLess (DMA1, Ones), LGreater (DMA1, Zero)))
                                {
                                    Store (DMA1, PIO1)
                                    Or (GSUE, 0x80, GSUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x02))
                        {
                            Or (GMUE, 0x20, GMUE)
                        }

                        If (And (CHNF, 0x08))
                        {
                            Or (GSUE, 0x20, GSUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                            Local1)
                        Store (Local1, GMPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GMUE, 0x50, GMUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Store (Local1, GSPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GSUE, 0x50, GSUE)
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                    0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT03, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT04, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    Add (Local0, 0x08, Local1)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, 0x02, Local0), A001)
                    CreateByteField (ATAB, Add (Local0, 0x06), A005)
                    Store (Arg0, CMDX)
                    Store (Arg1, A001)
                    Store (Arg2, A005)
                    Increment (CMDC)
                }

                Method (GTF, 2, Serialized)
                {
                    Store (Arg1, Debug)
                    Store (Zero, CMDC)
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        Store (IW49, ID49)
                        CreateWordField (Arg1, 0x6A, IW53)
                        Store (IW53, ID53)
                        CreateWordField (Arg1, 0x7E, IW63)
                        Store (IW63, ID63)
                        CreateWordField (Arg1, 0x76, IW59)
                        Store (IW59, ID59)
                        CreateWordField (Arg1, 0xB0, IW88)
                        Store (IW88, ID88)
                    }

                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                        And (CHNF, 0x08, IRDY)
                        If (And (CHNF, 0x10))
                        {
                            Store (PIO1, PIOT)
                        }
                        Else
                        {
                            Store (PIO0, PIOT)
                        }

                        If (And (CHNF, 0x04))
                        {
                            If (And (CHNF, 0x10))
                            {
                                Store (DMA1, DMAT)
                            }
                            Else
                            {
                                Store (DMA0, DMAT)
                            }
                        }
                    }
                    Else
                    {
                        And (CHNF, 0x02, IRDY)
                        Store (PIO0, PIOT)
                        If (And (CHNF, One))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (LAnd (And (ID53, 0x04), And (ID88, 0xFF00
                        )), DMAT))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, 
                            Zero, Zero), Local1)
                        If (LGreater (Local1, 0x05))
                        {
                            Store (0x05, Local1)
                        }

                        GTFB (AT01, Or (0x40, Local1), Local7)
                    }
                    Else
                    {
                        If (LAnd (And (ID63, 0xFF00), PIOT))
                        {
                            And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                                Zero, Zero), 0x03, Local0)
                            Or (0x20, DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0
                                )), Local1)
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                            Zero, Zero), 0x03, Local0)
                        Or (0x08, DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0
                            )), Local1)
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If (And (ID49, 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (LAnd (And (ID59, 0x0100), And (ID59, 0xFF)))
                    {
                        GTFB (AT03, And (ID59, 0xFF), Local7)
                    }

                    Store (ATAB, Debug)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Store (RETB, Debug)
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0000)
                Name (_S4D, 0x02)
                Name (_S3D, 0x02)
                Name (_S2D, 0x02)
                Name (_S1D, 0x02)
                Device (HUBN)
                {
                    Name (_ADR, Zero)
                    Device (PR10)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x10)
                        {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Device (PR30)
                        {
                            Name (_ADR, One)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1C, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR36)
                        {
                            Name (_ADR, 0x07)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB0, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR37)
                        {
                            Name (_ADR, 0x08)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L1D, 0, NotSerialized)
            {
                \_SB.PCI0.SBRG.SIOH ()
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L08, 0, NotSerialized)
            {
                \_SB.PCI0.SBRG.SIOH ()
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0B, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.BR20, 0x02)
                Notify (\_SB.PCI0.PEX6.BR24, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0D, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.USBE, 0x02)
                Notify (\_SB.PCI0.EUSB, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L09, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.P0P3, 0x02)
                Notify (\_SB.PCI0.P0P4, 0x02)
                Notify (\_SB.PCI0.P0P1, 0x02)
                Notify (\_SB.PCI0.P0P2, 0x02)
                Notify (\_SB.PCI0.PEX0, 0x02)
                Notify (\_SB.PCI0.PEX1, 0x02)
                Notify (\_SB.PCI0.PEX2, 0x02)
                Notify (\_SB.PCI0.PEX3, 0x02)
                Notify (\_SB.PCI0.PEX4, 0x02)
                Notify (\_SB.PCI0.PEX5, 0x02)
                Notify (\_SB.PCI0.PEX6, 0x02)
                Notify (\_SB.PCI0.PEX7, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Name (_UID, 0xAA)
            Name (_STA, 0x0B)
            Method (_PRW, 0, NotSerialized)
            {
                Return (GPRW (0x08, 0x04))
            }
        }
    }

    OperationRegion (_SB.PCI0.SBRG.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.SBRG.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
                Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, One)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRA, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRA, 0x80, PIRA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRA, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRB, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRB, 0x80, PIRB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRB, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRC, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRC, 0x80, PIRC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRC, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRD, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRD, 0x80, PIRD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRD, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRD)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x05)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRE, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRE, 0x80, PIRE)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRE, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x06)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRF, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRF, 0x80, PIRF)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRF, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x07)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRG, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRG, 0x80, PIRG)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRG, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x08)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRH, 0x80, Local0)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRH, 0x80, PIRH)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRH, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }
    }

    Scope (_SB.PCI0.SBRG)
    {
        Method (SIOH, 0, NotSerialized)
        {
            If (And (PMFG, 0x10))
            {
                Notify (PS2K, 0x02)
            }

            If (And (PMFG, 0x20))
            {
                Notify (PS2M, 0x02)
            }
        }
    }

    Scope (_PR)
    {
        OperationRegion (SSDT, SystemMemory, 0xDF5CF818, 0x079C)
        OperationRegion (CSDT, SystemMemory, 0xDF5D6A18, 0x021C)
        Name (NCST, 0x02)
        Name (NPSS, 0x10)
        Name (HNDL, 0x80000000)
        Name (CHDL, 0x80000000)
        Name (TNLP, 0x08)
        Name (CINT, Zero)
        Name (PDCV, 0xFFFFFFFF)
        Name (APSS, Package (0x10)
        {
            Package (0x06)
            {
                0x0D49, 
                0x00017318, 
                0x0A, 
                0x0A, 
                0x2600, 
                0x2600
            }, 

            Package (0x06)
            {
                0x0D48, 
                0x00017318, 
                0x0A, 
                0x0A, 
                0x2500, 
                0x2500
            }, 

            Package (0x06)
            {
                0x0CE4, 
                0x00016378, 
                0x0A, 
                0x0A, 
                0x2400, 
                0x2400
            }, 

            Package (0x06)
            {
                0x0C80, 
                0x000157C0, 
                0x0A, 
                0x0A, 
                0x2300, 
                0x2300
            }, 

            Package (0x06)
            {
                0x0C1C, 
                0x00014820, 
                0x0A, 
                0x0A, 
                0x2200, 
                0x2200
            }, 

            Package (0x06)
            {
                0x0BB8, 
                0x00013C68, 
                0x0A, 
                0x0A, 
                0x2100, 
                0x2100
            }, 

            Package (0x06)
            {
                0x0B54, 
                0x00012CC8, 
                0x0A, 
                0x0A, 
                0x2000, 
                0x2000
            }, 

            Package (0x06)
            {
                0x0AF0, 
                0x00012110, 
                0x0A, 
                0x0A, 
                0x1F00, 
                0x1F00
            }, 

            Package (0x06)
            {
                0x0A8C, 
                0x00011558, 
                0x0A, 
                0x0A, 
                0x1E00, 
                0x1E00
            }, 

            Package (0x06)
            {
                0x0A28, 
                0x000109A0, 
                0x0A, 
                0x0A, 
                0x1D00, 
                0x1D00
            }, 

            Package (0x06)
            {
                0x09C4, 
                0xFDE8, 
                0x0A, 
                0x0A, 
                0x1C00, 
                0x1C00
            }, 

            Package (0x06)
            {
                0x0960, 
                0xF230, 
                0x0A, 
                0x0A, 
                0x1B00, 
                0x1B00
            }, 

            Package (0x06)
            {
                0x08FC, 
                0xE678, 
                0x0A, 
                0x0A, 
                0x1A00, 
                0x1A00
            }, 

            Package (0x06)
            {
                0x0898, 
                0xDAC0, 
                0x0A, 
                0x0A, 
                0x1900, 
                0x1900
            }, 

            Package (0x06)
            {
                0x0834, 
                0xCF08, 
                0x0A, 
                0x0A, 
                0x1800, 
                0x1800
            }, 

            Package (0x06)
            {
                0x0640, 
                0x7D00, 
                0x0A, 
                0x0A, 
                0x1000, 
                0x1000
            }
        })
        Name (PTCI, Package (0x02)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x04,               // Bit Width
                    0x01,               // Bit Offset
                    0x0000000000000410, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x04,               // Bit Width
                    0x01,               // Bit Offset
                    0x0000000000000410, // Address
                    ,)
            }
        })
        Name (\PSTE, Zero)
        Name (\TSTE, Zero)
        Name (TSSI, Package (0x01)
        {
            Package (0x05)
            {
                0x64, 
                0x03E8, 
                Zero, 
                Zero, 
                Zero
            }
        })
        Name (TSSM, Package (0x08)
        {
            Package (0x05)
            {
                0x64, 
                0x03E8, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x05)
            {
                0x58, 
                0x036B, 
                Zero, 
                0x1E, 
                Zero
            }, 

            Package (0x05)
            {
                0x4B, 
                0x02EE, 
                Zero, 
                0x1C, 
                Zero
            }, 

            Package (0x05)
            {
                0x3F, 
                0x0271, 
                Zero, 
                0x1A, 
                Zero
            }, 

            Package (0x05)
            {
                0x32, 
                0x01F4, 
                Zero, 
                0x18, 
                Zero
            }, 

            Package (0x05)
            {
                0x26, 
                0x0177, 
                Zero, 
                0x16, 
                Zero
            }, 

            Package (0x05)
            {
                0x19, 
                0xFA, 
                Zero, 
                0x14, 
                Zero
            }, 

            Package (0x05)
            {
                0x0D, 
                0x7D, 
                Zero, 
                0x12, 
                Zero
            }
        })
        Name (C1ST, Package (0x02)
        {
            One, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000000, // Address
                        ,)
                }, 

                One, 
                One, 
                0x03E8
            }
        })
        Name (CMST, Package (0x04)
        {
            0x03, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x01,               // Bit Width
                        0x02,               // Bit Offset
                        0x0000000000000000, // Address
                        0x01,               // Access Size
                        )
                }, 

                One, 
                One, 
                0x03E8
            }, 

            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x01,               // Bit Width
                        0x02,               // Bit Offset
                        0x0000000000000010, // Address
                        0x03,               // Access Size
                        )
                }, 

                0x02, 
                0x50, 
                0x01F4
            }, 

            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x01,               // Bit Width
                        0x02,               // Bit Offset
                        0x0000000000000020, // Address
                        0x03,               // Access Size
                        )
                }, 

                0x03, 
                0x68, 
                0x015E
            }
        })
        Name (CIST, Package (0x04)
        {
            0x03, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000000, // Address
                        ,)
                }, 

                One, 
                One, 
                0x03E8
            }, 

            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000414, // Address
                        ,)
                }, 

                0x02, 
                0x50, 
                0x01F4
            }, 

            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000415, // Address
                        ,)
                }, 

                0x03, 
                0x68, 
                0x015E
            }
        })
        Method (CST, 0, NotSerialized)
        {
            If (LNotEqual (And (PDCV, 0x0200), 0x0200))
            {
                If (LEqual (NCST, 0x02))
                {
                    Store (One, NCST)
                }
            }

            If (LEqual (NCST, Zero))
            {
                Return (C1ST)
            }

            If (LEqual (NCST, One))
            {
                Return (CIST)
            }

            If (LEqual (NCST, 0x02))
            {
                Return (CMST)
            }

            Return (C1ST)
        }

        Method (PDC, 1, NotSerialized)
        {
            CreateDWordField (Arg0, Zero, REVS)
            CreateDWordField (Arg0, 0x04, SIZE)
            Store (SizeOf (Arg0), Local0)
            Store (Subtract (Local0, 0x08), Local1)
            CreateField (Arg0, 0x40, Multiply (Local1, 0x08), TEMP)
            Name (STS0, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Concatenate (STS0, TEMP, Local2)
            OSC (Buffer (0x10)
                {
                    /* 0000 */    0x16, 0xA6, 0x77, 0x40, 0x0C, 0x29, 0xBE, 0x47, 
                    /* 0008 */    0x9E, 0xBD, 0xD8, 0x70, 0x58, 0x71, 0x39, 0x53
                }, REVS, SIZE, Local2)
        }

        Method (OSC, 4, NotSerialized)
        {
            CreateDWordField (Arg3, Zero, STS)
            CreateDWordField (Arg3, 0x04, CAP)
            CreateDWordField (Arg0, Zero, IID0)
            CreateDWordField (Arg0, 0x04, IID1)
            CreateDWordField (Arg0, 0x08, IID2)
            CreateDWordField (Arg0, 0x0C, IID3)
            Name (UID0, Buffer (0x10)
            {
                /* 0000 */    0x16, 0xA6, 0x77, 0x40, 0x0C, 0x29, 0xBE, 0x47, 
                /* 0008 */    0x9E, 0xBD, 0xD8, 0x70, 0x58, 0x71, 0x39, 0x53
            })
            CreateDWordField (UID0, Zero, EID0)
            CreateDWordField (UID0, 0x04, EID1)
            CreateDWordField (UID0, 0x08, EID2)
            CreateDWordField (UID0, 0x0C, EID3)
            If (LNot (LAnd (LAnd (LEqual (IID0, EID0), LEqual (IID1, EID1)), 
                LAnd (LEqual (IID2, EID2), LEqual (IID3, EID3)))))
            {
                Store (0x06, Index (STS, Zero))
                Return (Arg3)
            }

            And (PDCV, CAP, PDCV)
            If (LEqual (CINT, Zero))
            {
                Store (One, CINT)
                If (LEqual (And (PDCV, 0x09), 0x09))
                {
                    If (LNotEqual (NPSS, Zero))
                    {
                        Load (SSDT, HNDL)
                    }
                }

                If (LEqual (And (PDCV, 0x10), 0x10))
                {
                    If (LNotEqual (NCST, 0xFF))
                    {
                        Load (CSDT, CHDL)
                    }
                }
            }

            Return (Arg3)
        }

        Processor (P000, 0x01, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P001, 0x02, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P002, 0x03, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P003, 0x04, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P004, 0x05, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P005, 0x06, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P006, 0x07, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Processor (P007, 0x08, 0x00000410, 0x06)
        {
            Method (_PDC, 1, NotSerialized)
            {
                PDC (Arg0)
            }

            Method (_OSC, 4, NotSerialized)
            {
                Return (OSC (Arg0, Arg1, Arg2, Arg3))
            }
        }
    }

    OperationRegion (_SB.PCI0.SBRG.LPCR, PCI_Config, 0x80, 0x04)
    Field (\_SB.PCI0.SBRG.LPCR, ByteAcc, NoLock, Preserve)
    {
        CADR,   3, 
            ,   1, 
        CBDR,   3, 
                Offset (0x01), 
        LTDR,   2, 
            ,   2, 
        FDDR,   1, 
                Offset (0x02), 
        CALE,   1, 
        CBLE,   1, 
        LTLE,   1, 
        FDLE,   1, 
                Offset (0x03), 
        GLLE,   1, 
        GHLE,   1, 
        KCLE,   1, 
        MCLE,   1, 
        C1LE,   1, 
        C2LE,   1, 
                Offset (0x04)
    }

    Method (UXDV, 1, NotSerialized)
    {
        Store (0xFF, Local0)
        Name (T_0, Zero)
        Store (Add (Arg0, Zero), T_0)
        If (LEqual (T_0, 0x03F8))
        {
            Store (Zero, Local0)
        }
        Else
        {
            If (LEqual (T_0, 0x02F8))
            {
                Store (One, Local0)
            }
            Else
            {
                If (LEqual (T_0, 0x0220))
                {
                    Store (0x02, Local0)
                }
                Else
                {
                    If (LEqual (T_0, 0x0228))
                    {
                        Store (0x03, Local0)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x0238))
                        {
                            Store (0x04, Local0)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x02E8))
                            {
                                Store (0x05, Local0)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x0338))
                                {
                                    Store (0x06, Local0)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x03E8))
                                    {
                                        Store (0x07, Local0)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Return (Local0)
    }

    Method (RRIO, 4, NotSerialized)
    {
        Name (T_0, Zero)
        Store (Add (Arg0, Zero), T_0)
        If (LEqual (T_0, Zero))
        {
            Store (Zero, CALE)
            Store (UXDV (Arg2), Local0)
            If (LNotEqual (Local0, 0xFF))
            {
                Store (Local0, CADR)
            }

            If (Arg1)
            {
                Store (One, CALE)
            }
        }
        Else
        {
            If (LEqual (T_0, One))
            {
                Store (Zero, CBLE)
                Store (UXDV (Arg2), Local0)
                If (LNotEqual (Local0, 0xFF))
                {
                    Store (Local0, CBDR)
                }

                If (Arg1)
                {
                    Store (One, CBLE)
                }
            }
            Else
            {
                If (LEqual (T_0, 0x02))
                {
                    Store (Zero, LTLE)
                    If (LEqual (Arg2, 0x0378))
                    {
                        Store (Zero, LTDR)
                    }

                    If (LEqual (Arg2, 0x0278))
                    {
                        Store (One, LTDR)
                    }

                    If (LEqual (Arg2, 0x03BC))
                    {
                        Store (0x02, LTDR)
                    }

                    If (Arg1)
                    {
                        Store (One, LTLE)
                    }
                }
                Else
                {
                    If (LEqual (T_0, 0x03))
                    {
                        Store (Zero, FDLE)
                        If (LEqual (Arg2, 0x03F0))
                        {
                            Store (Zero, FDDR)
                        }

                        If (LEqual (Arg2, 0x0370))
                        {
                            Store (One, FDDR)
                        }

                        If (Arg1)
                        {
                            Store (One, FDLE)
                        }
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x08))
                        {
                            If (LEqual (Arg2, 0x0200))
                            {
                                If (Arg1)
                                {
                                    Store (One, GLLE)
                                }
                                Else
                                {
                                    Store (Zero, GLLE)
                                }
                            }

                            If (LEqual (Arg2, 0x0208))
                            {
                                If (Arg1)
                                {
                                    Store (One, GHLE)
                                }
                                Else
                                {
                                    Store (Zero, GHLE)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x09))
                            {
                                If (LEqual (Arg2, 0x0200))
                                {
                                    If (Arg1)
                                    {
                                        Store (One, GLLE)
                                    }
                                    Else
                                    {
                                        Store (Zero, GLLE)
                                    }
                                }

                                If (LEqual (Arg2, 0x0208))
                                {
                                    If (Arg1)
                                    {
                                        Store (One, GHLE)
                                    }
                                    Else
                                    {
                                        Store (Zero, GHLE)
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x0A))
                                {
                                    If (LOr (LEqual (Arg2, 0x60), LEqual (Arg2, 0x64)))
                                    {
                                        If (Arg1)
                                        {
                                            Store (One, KCLE)
                                        }
                                        Else
                                        {
                                            Store (Zero, KCLE)
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x0B))
                                    {
                                        If (LOr (LEqual (Arg2, 0x62), LEqual (Arg2, 0x66)))
                                        {
                                            If (Arg1)
                                            {
                                                Store (One, MCLE)
                                            }
                                            Else
                                            {
                                                Store (Zero, MCLE)
                                            }
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x0C))
                                        {
                                            If (LEqual (Arg2, 0x2E))
                                            {
                                                If (Arg1)
                                                {
                                                    Store (One, C1LE)
                                                }
                                                Else
                                                {
                                                    Store (Zero, C1LE)
                                                }
                                            }

                                            If (LEqual (Arg2, 0x4E))
                                            {
                                                If (Arg1)
                                                {
                                                    Store (One, C2LE)
                                                }
                                                Else
                                                {
                                                    Store (Zero, C2LE)
                                                }
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x0D))
                                            {
                                                If (LEqual (Arg2, 0x2E))
                                                {
                                                    If (Arg1)
                                                    {
                                                        Store (One, C1LE)
                                                    }
                                                    Else
                                                    {
                                                        Store (Zero, C1LE)
                                                    }
                                                }

                                                If (LEqual (Arg2, 0x4E))
                                                {
                                                    If (Arg1)
                                                    {
                                                        Store (One, C2LE)
                                                    }
                                                    Else
                                                    {
                                                        Store (Zero, C2LE)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Method (RDMA, 3, NotSerialized)
    {
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103"))
                Name (ATT3, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0}
                    IRQNoFlags ()
                        {8}
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        )
                })
                Name (ATT4, ResourceTemplate ()
                {
                })
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (ATT3)
                }
            }
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBG8)
        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (Zero, AAXB)
        Store (One, \_SB.SLPS)
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44, 
                    /* 0008 */    0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
                }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                            0x03
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                0x00
            }, Arg4)
        Return (Zero)
    }

    Method (_WAK, 1, NotSerialized)
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        WAK (Arg0)
        If (IOWK) {}
        Else
        {
            Notify (\_SB.PWRB, 0x02)
        }

        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    OperationRegion (IORK, SystemIO, 0xB3, One)
    Field (IORK, ByteAcc, NoLock, Preserve)
    {
        IOWK,   8
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02"))
        Name (_UID, 0x0E11)
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01"))
        Name (_UID, One)
    }

    Scope (\)
    {
        Device (AMW0)
        {
            Name (_HID, EisaId ("PNP0C14"))
            Name (_UID, "ASUSWMI")
            Name (_WDG, Buffer (0x50)
            {
                /* 0000 */    0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11, 
                /* 0008 */    0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66, 
                /* 0010 */    0x42, 0x43, 0x01, 0x02, 0xA0, 0x47, 0x67, 0x46, 
                /* 0018 */    0xEC, 0x70, 0xDE, 0x11, 0x8A, 0x39, 0x08, 0x00, 
                /* 0020 */    0x20, 0x0C, 0x9A, 0x66, 0x42, 0x44, 0x01, 0x02, 
                /* 0028 */    0x72, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1, 0x11, 
                /* 0030 */    0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00, 0x00, 
                /* 0038 */    0xD2, 0x00, 0x01, 0x08, 0x21, 0x12, 0x90, 0x05, 
                /* 0040 */    0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0, 
                /* 0048 */    0xC9, 0x06, 0x29, 0x10, 0x4D, 0x4F, 0x01, 0x00
            })
            Name (CCAC, Zero)
            Name (ECD2, Zero)
            Name (EID2, Zero)
            Method (WED2, 1, NotSerialized)
            {
                Store (Arg0, ECD2)
            }

            Method (WMBC, 3, NotSerialized)
            {
                Store (One, Local0)
                Name (T_0, Zero)
                Store (Arg1, T_0)
                If (LEqual (T_0, 0x43455053))
                {
                    Return (SPEC (Arg2))
                }
                Else
                {
                    If (LEqual (T_0, 0x50564544))
                    {
                        Return (DEVP (Arg2))
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x50534453))
                        {
                            Return (SDSP (Arg2))
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x50534447))
                            {
                                Return (GDSP (Arg2))
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x53564544))
                                {
                                    Return (DEVS (Arg2))
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x53544344))
                                    {
                                        Return (DSTS (Arg2))
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x44495047))
                                        {
                                            Return (GPID ())
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x5446424B))
                                            {
                                                Return (KBFT (Arg2))
                                            }
                                            Else
                                            {
                                                If (LEqual (T_0, 0x59454B48))
                                                {
                                                    Return (HKEY ())
                                                }
                                                Else
                                                {
                                                    Return (Zero)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Return (Local0)
            }

            Method (RSMB, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WSMB, 1, Serialized)
            {
                Return (Zero)
            }

            Method (RSMW, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WSMW, 1, Serialized)
            {
                Return (Zero)
            }

            Method (RSMK, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WSMK, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WMBD, 3, NotSerialized)
            {
                Store (One, Local0)
                Name (T_0, Zero)
                Store (Arg1, T_0)
                If (LEqual (T_0, 0x424D5352))
                {
                    Return (RSMB (Arg2))
                }
                Else
                {
                    If (LEqual (T_0, 0x424D5357))
                    {
                        Return (WSMB (Arg2))
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x574D5352))
                        {
                            Return (RSMW (Arg2))
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x574D5357))
                            {
                                Return (WSMW (Arg2))
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x4B4D5352))
                                {
                                    Return (RSMK (Arg2))
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x4B4D5357))
                                    {
                                        Return (WSMK (Arg2))
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }
                            }
                        }
                    }
                }

                Return (Local0)
            }

            Method (_WED, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0xD2))
                {
                    Return (EID2)
                }

                Return (Zero)
            }

            Method (AMWR, 1, Serialized)
            {
                Store (Zero, Local1)
                If (ECD2)
                {
                    Store (Arg0, EID2)
                    Notify (AMW0, 0xD2)
                    Store (One, Local1)
                }
                Else
                {
                }

                Return (Local1)
            }

            Method (AMWN, 1, Serialized)
            {
                Store (AMWR (Arg0), Local0)
                Return (Local0)
            }

            Name (WQMO, Buffer (0x09A6)
            {
                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                /* 0008 */    0x96, 0x09, 0x00, 0x00, 0x42, 0x38, 0x00, 0x00, 
                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                /* 0018 */    0xA8, 0xD1, 0x9A, 0x00, 0x01, 0x06, 0x18, 0x42, 
                /* 0020 */    0x10, 0x07, 0x10, 0x4A, 0x29, 0x86, 0x42, 0x04, 
                /* 0028 */    0x0A, 0x0D, 0xA1, 0x38, 0x0A, 0x60, 0x30, 0x12, 
                /* 0030 */    0x20, 0x24, 0x07, 0x42, 0x2E, 0x98, 0x98, 0x00, 
                /* 0038 */    0x11, 0x10, 0xF2, 0x2A, 0xC0, 0xA6, 0x00, 0x93, 
                /* 0040 */    0x20, 0xEA, 0xDF, 0x1F, 0xA2, 0x24, 0x38, 0x94, 
                /* 0048 */    0x10, 0x08, 0x49, 0x14, 0x60, 0x5E, 0x80, 0x6E, 
                /* 0050 */    0x01, 0x86, 0x05, 0xD8, 0x16, 0x60, 0x5A, 0x80, 
                /* 0058 */    0x63, 0x48, 0x2A, 0x0D, 0x9C, 0x12, 0x58, 0x0A, 
                /* 0060 */    0x84, 0x84, 0x0A, 0x50, 0x2E, 0xC0, 0xB7, 0x00, 
                /* 0068 */    0xED, 0x88, 0x92, 0x2C, 0xC0, 0x32, 0x8C, 0x08, 
                /* 0070 */    0x3C, 0x8A, 0xC8, 0x46, 0xE3, 0x04, 0x65, 0x43, 
                /* 0078 */    0xA3, 0x64, 0x40, 0xC8, 0xB3, 0x00, 0xEB, 0xC0, 
                /* 0080 */    0x84, 0xC0, 0xEE, 0x05, 0x98, 0x13, 0xE0, 0x4D, 
                /* 0088 */    0x80, 0xB8, 0x61, 0x68, 0x85, 0x07, 0x10, 0xAA, 
                /* 0090 */    0x30, 0x01, 0xB6, 0x60, 0x84, 0x52, 0x1B, 0x8C, 
                /* 0098 */    0x50, 0x1A, 0x43, 0xD0, 0x30, 0x8C, 0x12, 0xF1, 
                /* 00A0 */    0x90, 0x3A, 0x83, 0x15, 0x4A, 0xC4, 0x30, 0x21, 
                /* 00A8 */    0x22, 0x54, 0x86, 0x41, 0x86, 0x15, 0x2A, 0x5A, 
                /* 00B0 */    0xDC, 0x08, 0xED, 0x0F, 0x82, 0x44, 0x5B, 0xB1, 
                /* 00B8 */    0x86, 0xEA, 0x48, 0xA3, 0x41, 0x0D, 0x2F, 0xC1, 
                /* 00C0 */    0xE1, 0x7A, 0xA8, 0xE7, 0xD8, 0xB9, 0x00, 0xE9, 
                /* 00C8 */    0xC0, 0x02, 0x09, 0x7E, 0x16, 0x75, 0x8E, 0x93, 
                /* 00D0 */    0x80, 0x24, 0x30, 0xD6, 0xF1, 0xB3, 0x81, 0xE3, 
                /* 00D8 */    0x5D, 0x03, 0x6A, 0xC6, 0xC7, 0xCB, 0x04, 0xC1, 
                /* 00E0 */    0xA1, 0x86, 0xE8, 0x81, 0x86, 0x3B, 0x81, 0x43, 
                /* 00E8 */    0x64, 0x80, 0x9E, 0xD3, 0xD1, 0x60, 0x0E, 0x00, 
                /* 00F0 */    0x76, 0x38, 0x19, 0xDD, 0x03, 0x4A, 0x15, 0x60, 
                /* 00F8 */    0x76, 0xCC, 0xB2, 0x08, 0xA4, 0xF1, 0x18, 0xFA, 
                /* 0100 */    0x74, 0xCF, 0xE7, 0x84, 0x13, 0x58, 0xFE, 0x20, 
                /* 0108 */    0x50, 0x23, 0x33, 0xB4, 0x0D, 0x4E, 0x4B, 0x98, 
                /* 0110 */    0x21, 0x0F, 0xFF, 0xB0, 0x98, 0x58, 0x08, 0x7D, 
                /* 0118 */    0x10, 0x3C, 0x1E, 0x78, 0xFF, 0xFF, 0xF1, 0x80, 
                /* 0120 */    0x47, 0xF1, 0x99, 0x40, 0x08, 0xAF, 0x04, 0xB1, 
                /* 0128 */    0x3D, 0xA0, 0xE7, 0x04, 0x03, 0x63, 0x07, 0x64, 
                /* 0130 */    0xBF, 0x02, 0x10, 0x82, 0x97, 0x39, 0x22, 0x39, 
                /* 0138 */    0x45, 0xD0, 0x98, 0x8C, 0xD1, 0x2A, 0x84, 0x86, 
                /* 0140 */    0x10, 0xDA, 0x10, 0x67, 0x17, 0xFF, 0xE0, 0x0D, 
                /* 0148 */    0x73, 0xEE, 0x26, 0x28, 0x72, 0x04, 0xA8, 0xCF, 
                /* 0150 */    0x84, 0x47, 0xC0, 0x8F, 0x01, 0xD1, 0x43, 0x9F, 
                /* 0158 */    0x4D, 0xF4, 0xE3, 0x89, 0x72, 0x12, 0x07, 0xE4, 
                /* 0160 */    0x33, 0x83, 0x11, 0x82, 0x97, 0x7B, 0x48, 0x20, 
                /* 0168 */    0x9A, 0xE7, 0xA0, 0x13, 0xC3, 0x39, 0x1D, 0x02, 
                /* 0170 */    0x53, 0xA3, 0x05, 0xA2, 0x09, 0x10, 0x45, 0x59, 
                /* 0178 */    0xAA, 0x6C, 0x2C, 0xD5, 0x83, 0xA0, 0x82, 0x80, 
                /* 0180 */    0x34, 0x77, 0x43, 0x9C, 0xB4, 0x91, 0x03, 0xC7, 
                /* 0188 */    0xA8, 0x7E, 0xD8, 0x54, 0x04, 0x9C, 0x0E, 0x1B, 
                /* 0190 */    0x1E, 0xB7, 0xE3, 0x93, 0x28, 0xFA, 0x80, 0x28, 
                /* 0198 */    0x9C, 0xC3, 0x9E, 0x39, 0x28, 0x88, 0x01, 0x9D, 
                /* 01A0 */    0x04, 0x42, 0x4E, 0x8E, 0x02, 0xA8, 0xBD, 0x68, 
                /* 01A8 */    0x58, 0x1A, 0xD7, 0xA9, 0xBD, 0x09, 0x78, 0x5A, 
                /* 01B0 */    0x8F, 0x05, 0x87, 0x71, 0x5C, 0x67, 0x6D, 0xD1, 
                /* 01B8 */    0x37, 0x06, 0x3A, 0x1F, 0xDF, 0x05, 0xB8, 0x06, 
                /* 01C0 */    0x08, 0xCD, 0xC8, 0xF0, 0x56, 0x03, 0x48, 0xC1, 
                /* 01C8 */    0xF8, 0x49, 0xE0, 0x11, 0xC0, 0x04, 0xD6, 0x75, 
                /* 01D0 */    0x20, 0x80, 0x7E, 0xD9, 0xF0, 0xF0, 0x7D, 0xC2, 
                /* 01D8 */    0x78, 0xBC, 0x48, 0x50, 0xDF, 0x7D, 0x00, 0x14, 
                /* 01E0 */    0x40, 0x3E, 0x00, 0x58, 0xE9, 0x1D, 0x80, 0x8E, 
                /* 01E8 */    0x21, 0x44, 0x98, 0x68, 0x46, 0xE7, 0x12, 0x56, 
                /* 01F0 */    0xAA, 0xFF, 0xFF, 0x68, 0xF9, 0x41, 0xC5, 0xA3, 
                /* 01F8 */    0x35, 0x88, 0x47, 0xEB, 0x40, 0xA3, 0x45, 0x1F, 
                /* 0200 */    0x33, 0xAC, 0x70, 0x54, 0xF2, 0x39, 0x01, 0x0D, 
                /* 0208 */    0x17, 0x06, 0x41, 0xE1, 0x07, 0x0E, 0x68, 0x80, 
                /* 0210 */    0xA7, 0xF7, 0x66, 0xE0, 0x99, 0x18, 0xCE, 0xF3, 
                /* 0218 */    0xE5, 0x70, 0x9E, 0x2F, 0x1F, 0x8E, 0x0F, 0x14, 
                /* 0220 */    0xF0, 0x07, 0x8C, 0x25, 0x28, 0x70, 0xC2, 0x20, 
                /* 0228 */    0x87, 0xC7, 0x08, 0x1E, 0x2C, 0x95, 0x35, 0x2E, 
                /* 0230 */    0xD4, 0xFD, 0xC0, 0x27, 0x1A, 0x86, 0x7D, 0xA8, 
                /* 0238 */    0x47, 0xF3, 0x96, 0x70, 0x86, 0x6F, 0x13, 0x07, 
                /* 0240 */    0xF5, 0xEE, 0x61, 0xA7, 0x42, 0x2D, 0x3A, 0x84, 
                /* 0248 */    0xF5, 0x48, 0x39, 0xAC, 0xD1, 0xC2, 0x1E, 0xF0, 
                /* 0250 */    0x73, 0x87, 0xEF, 0x19, 0xFC, 0x4A, 0xE3, 0x63, 
                /* 0258 */    0x08, 0x5D, 0x85, 0x4E, 0x15, 0x5C, 0x14, 0x84, 
                /* 0260 */    0xE2, 0xAD, 0x45, 0xC3, 0x3F, 0x0B, 0x8F, 0xEB, 
                /* 0268 */    0x15, 0xC3, 0x57, 0x80, 0x87, 0x13, 0x9F, 0x01, 
                /* 0270 */    0xE2, 0x07, 0x3A, 0x82, 0x17, 0x11, 0x9F, 0x7D, 
                /* 0278 */    0x7C, 0x79, 0xF1, 0x21, 0x83, 0x9D, 0x2C, 0x78, 
                /* 0280 */    0x08, 0x0A, 0xC5, 0x38, 0x1C, 0xA0, 0x84, 0xC3, 
                /* 0288 */    0x08, 0xCE, 0x20, 0x1E, 0x9E, 0x83, 0x1C, 0x0E, 
                /* 0290 */    0xD0, 0xE7, 0x20, 0x0F, 0x84, 0x0D, 0xC2, 0x20, 
                /* 0298 */    0xE7, 0xF1, 0xF2, 0xC3, 0x2E, 0x16, 0xF8, 0xFF, 
                /* 02A0 */    0xFF, 0xC5, 0x02, 0x78, 0xA5, 0x19, 0x14, 0x5A, 
                /* 02A8 */    0xCF, 0xA0, 0x20, 0x60, 0x3C, 0x3F, 0x78, 0xBC, 
                /* 02B0 */    0x9E, 0xAD, 0xA7, 0x05, 0xDE, 0x11, 0xFB, 0xFC, 
                /* 02B8 */    0x01, 0x9C, 0xC3, 0x1F, 0x5E, 0x50, 0x71, 0x87, 
                /* 02C0 */    0x44, 0x41, 0x7C, 0x36, 0x70, 0x94, 0xF1, 0xA2, 
                /* 02C8 */    0x67, 0xE2, 0xC3, 0x90, 0x8F, 0x0B, 0x4F, 0x37, 
                /* 02D0 */    0x98, 0xC3, 0x07, 0xB8, 0x47, 0xE2, 0xC3, 0x07, 
                /* 02D8 */    0xF0, 0xF8, 0xFF, 0x1F, 0x3E, 0x80, 0x9F, 0x44, 
                /* 02E0 */    0x8B, 0x5A, 0x85, 0x1E, 0x3E, 0xC0, 0x15, 0xE4, 
                /* 02E8 */    0x84, 0x84, 0x96, 0x73, 0xF8, 0x40, 0x4E, 0x24, 
                /* 02F0 */    0x4C, 0x74, 0x9F, 0x91, 0x5E, 0x3C, 0x2C, 0xE1, 
                /* 02F8 */    0xE0, 0x81, 0x0A, 0x4F, 0xA2, 0xF8, 0xA7, 0x02, 
                /* 0300 */    0x54, 0xE0, 0x53, 0x01, 0x05, 0x31, 0xA0, 0x0F, 
                /* 0308 */    0x15, 0x70, 0x66, 0xF0, 0xEC, 0x85, 0x99, 0x07, 
                /* 0310 */    0x8C, 0x33, 0x12, 0x60, 0xEB, 0x50, 0x01, 0xDE, 
                /* 0318 */    0xFF, 0xFF, 0xA1, 0x02, 0x38, 0x1C, 0x90, 0x00, 
                /* 0320 */    0x59, 0x12, 0x2F, 0x48, 0x0F, 0x15, 0xE0, 0x3A, 
                /* 0328 */    0x70, 0xFA, 0x50, 0xC1, 0x0F, 0x9A, 0x16, 0x05, 
                /* 0330 */    0xA4, 0x23, 0x9E, 0x0F, 0x15, 0x30, 0x2E, 0x42, 
                /* 0338 */    0x86, 0x7F, 0xAD, 0x3B, 0x96, 0xE7, 0x30, 0x72, 
                /* 0340 */    0xAE, 0x40, 0xC7, 0x3E, 0x18, 0xA0, 0x82, 0x8E, 
                /* 0348 */    0x9E, 0x82, 0x18, 0xD0, 0x29, 0x0E, 0x06, 0x68, 
                /* 0350 */    0x1D, 0xE7, 0x0A, 0xD4, 0x31, 0x0E, 0xF8, 0xFD, 
                /* 0358 */    0xFF, 0xCF, 0x14, 0xC0, 0x49, 0xC4, 0xD1, 0x0A, 
                /* 0360 */    0x35, 0x5C, 0x8F, 0xD5, 0x20, 0x1E, 0xAB, 0x8F, 
                /* 0368 */    0xA1, 0x1E, 0x2B, 0xEE, 0x1B, 0xE0, 0x23, 0x00, 
                /* 0370 */    0xFE, 0xE8, 0x84, 0x03, 0x7B, 0xAE, 0x00, 0x4C, 
                /* 0378 */    0x7B, 0x3C, 0x57, 0x80, 0x4E, 0xDA, 0xD9, 0x07, 
                /* 0380 */    0x1D, 0x70, 0xAD, 0x3A, 0x89, 0xE1, 0xCF, 0x71, 
                /* 0388 */    0x8C, 0x60, 0xA8, 0xC3, 0x1B, 0x85, 0x70, 0x1C, 
                /* 0390 */    0x0A, 0x85, 0x39, 0x19, 0xD0, 0xFF, 0xFF, 0x11, 
                /* 0398 */    0x96, 0xC0, 0x51, 0x10, 0x0F, 0xCD, 0x61, 0xCE, 
                /* 03A0 */    0x70, 0xA0, 0x39, 0x16, 0xC0, 0xBB, 0x55, 0xB0, 
                /* 03A8 */    0x63, 0x01, 0x6C, 0x02, 0x1F, 0x0B, 0xC0, 0x17, 
                /* 03B0 */    0x67, 0x58, 0xE8, 0xD1, 0xFA, 0xFE, 0x87, 0xBB, 
                /* 03B8 */    0x3F, 0x44, 0x79, 0x29, 0xF6, 0x21, 0x07, 0xEE, 
                /* 03C0 */    0xB8, 0xC0, 0x71, 0x7A, 0x00, 0x5C, 0x1D, 0xC4, 
                /* 03C8 */    0xE4, 0xF4, 0xF4, 0x00, 0xAE, 0x24, 0xA7, 0x07, 
                /* 03D0 */    0xD4, 0x80, 0xFD, 0xFF, 0xD7, 0x03, 0xA4, 0x73, 
                /* 03D8 */    0x02, 0xF6, 0xA2, 0xCD, 0x20, 0x4E, 0xF4, 0x79, 
                /* 03E0 */    0xC4, 0x0A, 0x8E, 0x38, 0xA8, 0xEC, 0x24, 0x4A, 
                /* 03E8 */    0x7E, 0xC4, 0x41, 0x65, 0x1D, 0x3B, 0x05, 0x31, 
                /* 03F0 */    0xA0, 0x4F, 0x94, 0x80, 0x8F, 0x3B, 0x0E, 0xB0, 
                /* 03F8 */    0xD8, 0xA8, 0x27, 0xCB, 0x23, 0x4F, 0x96, 0x82, 
                /* 0400 */    0x78, 0xB2, 0xBE, 0x54, 0x00, 0x87, 0x1B, 0x0E, 
                /* 0408 */    0xB0, 0xFF, 0xFF, 0x5F, 0x2A, 0x80, 0x92, 0x43, 
                /* 0410 */    0xA9, 0x97, 0x0A, 0x90, 0xC9, 0xBB, 0xE1, 0xA0, 
                /* 0418 */    0x43, 0xAE, 0x55, 0xF7, 0x3A, 0x76, 0x6C, 0xF5, 
                /* 0420 */    0xB8, 0x7D, 0x93, 0xC6, 0x04, 0xBB, 0xE1, 0xA0, 
                /* 0428 */    0x22, 0x51, 0x28, 0xD0, 0xB9, 0x00, 0x15, 0x01, 
                /* 0430 */    0x8E, 0x82, 0x78, 0x68, 0x3E, 0x17, 0x58, 0xC9, 
                /* 0438 */    0xB9, 0x00, 0xED, 0xFD, 0x42, 0x41, 0x06, 0xE7, 
                /* 0440 */    0x7B, 0x81, 0x61, 0x8A, 0x1F, 0x8A, 0xEE, 0x3D, 
                /* 0448 */    0x3E, 0x17, 0x80, 0xFB, 0x8A, 0x03, 0x2E, 0x63, 
                /* 0450 */    0x02, 0xB4, 0x41, 0x92, 0x7B, 0xB8, 0xC7, 0x85, 
                /* 0458 */    0x1B, 0x87, 0x47, 0x75, 0x4C, 0x31, 0x9F, 0xE3, 
                /* 0460 */    0x82, 0x3C, 0xC7, 0x79, 0x5E, 0xB8, 0xF3, 0x03, 
                /* 0468 */    0x70, 0xFB, 0xFF, 0x0F, 0x0C, 0xD6, 0x85, 0x0B, 
                /* 0470 */    0x88, 0x0B, 0x35, 0x29, 0xF1, 0xFC, 0x00, 0xAE, 
                /* 0478 */    0x5B, 0xB7, 0xEF, 0x85, 0x38, 0x29, 0x77, 0x57, 
                /* 0480 */    0x14, 0xC6, 0x2B, 0x49, 0x0C, 0xDF, 0x53, 0x8D, 
                /* 0488 */    0x6D, 0x98, 0x03, 0x38, 0x15, 0xE3, 0x24, 0x18, 
                /* 0490 */    0xFC, 0xEC, 0x40, 0xC7, 0xE5, 0xC8, 0x24, 0xBA, 
                /* 0498 */    0xED, 0xFB, 0x08, 0xC1, 0x63, 0x8E, 0x9E, 0x82, 
                /* 04A0 */    0x18, 0xD0, 0x19, 0x4E, 0x2A, 0x68, 0x15, 0x20, 
                /* 04A8 */    0x9A, 0x02, 0xE6, 0xE6, 0x0A, 0xF8, 0xFB, 0xFF, 
                /* 04B0 */    0xDF, 0x5C, 0x01, 0x56, 0xB8, 0x54, 0xA8, 0x51, 
                /* 04B8 */    0xEA, 0x91, 0x02, 0x5C, 0x77, 0x40, 0xDF, 0xC2, 
                /* 04C0 */    0x70, 0x92, 0x80, 0x74, 0x65, 0x3D, 0x8D, 0x07, 
                /* 04C8 */    0x00, 0x5F, 0x29, 0x60, 0x5C, 0x3C, 0xD9, 0x11, 
                /* 04D0 */    0x87, 0xDF, 0xAE, 0x7D, 0x2C, 0x00, 0xE6, 0xFF, 
                /* 04D8 */    0xFF, 0x2B, 0x21, 0x58, 0x8F, 0x05, 0xC0, 0x5B, 
                /* 04E0 */    0xA4, 0x4B, 0x8B, 0x66, 0x8F, 0x05, 0xE0, 0x12, 
                /* 04E8 */    0xBF, 0x0A, 0x7A, 0x50, 0xB1, 0x5C, 0x18, 0x94, 
                /* 04F0 */    0x84, 0xB1, 0x43, 0x19, 0xCD, 0xC1, 0x1C, 0x43, 
                /* 04F8 */    0x70, 0x76, 0x86, 0x31, 0x1C, 0x1F, 0xA8, 0xA7, 
                /* 0500 */    0xFE, 0x58, 0x7B, 0x1A, 0xAF, 0x68, 0xBE, 0xE2, 
                /* 0508 */    0xF9, 0x3E, 0x4A, 0x87, 0x88, 0xBA, 0xEA, 0x79, 
                /* 0510 */    0xAC, 0x6F, 0x05, 0xA7, 0xF6, 0xAC, 0xE7, 0x6B, 
                /* 0518 */    0x8B, 0x61, 0x12, 0x78, 0x88, 0x0C, 0x8D, 0x13, 
                /* 0520 */    0xBC, 0x23, 0x19, 0x9A, 0xCB, 0x80, 0xD0, 0x5D, 
                /* 0528 */    0xE9, 0x35, 0xC0, 0x73, 0x33, 0x41, 0xF7, 0x43, 
                /* 0530 */    0x97, 0x42, 0x04, 0x9D, 0x00, 0xDE, 0x09, 0x6A, 
                /* 0538 */    0x14, 0xE0, 0xED, 0x2A, 0x20, 0x5B, 0x02, 0xC4, 
                /* 0540 */    0x8D, 0x5E, 0x58, 0x6F, 0x45, 0x51, 0x42, 0x44, 
                /* 0548 */    0x08, 0x1A, 0xC5, 0x78, 0x11, 0x42, 0x85, 0x88, 
                /* 0550 */    0x12, 0xB5, 0x39, 0x10, 0x5D, 0x8E, 0xA2, 0x06, 
                /* 0558 */    0x89, 0x16, 0xCC, 0x08, 0xCC, 0xFE, 0x20, 0x88, 
                /* 0560 */    0xF4, 0x67, 0x80, 0x2E, 0x33, 0xBE, 0x0C, 0x7B, 
                /* 0568 */    0x34, 0xFC, 0x2C, 0xC5, 0x87, 0x7A, 0x8E, 0x8F, 
                /* 0570 */    0x8A, 0xEC, 0xFF, 0x0F, 0xF2, 0x5A, 0x68, 0x9D, 
                /* 0578 */    0xE3, 0x24, 0x87, 0x1C, 0x83, 0xEB, 0x0C, 0x01, 
                /* 0580 */    0xCD, 0x35, 0xA0, 0x8E, 0xFD, 0x1E, 0xAF, 0xBF, 
                /* 0588 */    0x1A, 0x86, 0xE3, 0x43, 0xF4, 0xA1, 0xC2, 0x13, 
                /* 0590 */    0x38, 0x44, 0x06, 0xE8, 0x43, 0x04, 0xFC, 0xF1, 
                /* 0598 */    0x18, 0xFA, 0x29, 0xC2, 0x13, 0x7E, 0xA1, 0x25, 
                /* 05A0 */    0x83, 0x40, 0x9D, 0x34, 0xF8, 0x48, 0x5F, 0xB8, 
                /* 05A8 */    0xD9, 0xED, 0xC3, 0x04, 0x16, 0x7B, 0x76, 0xA0, 
                /* 05B0 */    0xE3, 0x01, 0xBF, 0xE2, 0x33, 0x81, 0xAE, 0x71, 
                /* 05B8 */    0xC6, 0xF6, 0xC9, 0xC8, 0x11, 0x0E, 0x22, 0x50, 
                /* 05C0 */    0x40, 0x9F, 0x4D, 0xF8, 0xCD, 0x83, 0x1D, 0x2D, 
                /* 05C8 */    0xB8, 0xA8, 0xA3, 0x05, 0xEA, 0xB4, 0xE0, 0x83, 
                /* 05D0 */    0x02, 0x43, 0x7C, 0xF8, 0x34, 0xC4, 0x93, 0x05, 
                /* 05D8 */    0x3B, 0xEA, 0x80, 0x53, 0xDE, 0x21, 0x04, 0x14, 
                /* 05E0 */    0x20, 0x3E, 0x59, 0xB0, 0x79, 0x61, 0x08, 0x2C, 
                /* 05E8 */    0x12, 0x1E, 0x75, 0xE8, 0x30, 0x3C, 0x3F, 0x25, 
                /* 05F0 */    0x3C, 0x8E, 0x30, 0xEC, 0x37, 0x12, 0x4F, 0xE1, 
                /* 05F8 */    0x70, 0x7C, 0xA4, 0x30, 0x42, 0xF0, 0x72, 0x4F, 
                /* 0600 */    0x16, 0xE4, 0x62, 0x73, 0x74, 0xFF, 0xFF, 0x27, 
                /* 0608 */    0x18, 0xCC, 0x50, 0x3D, 0x04, 0x7E, 0x5E, 0xF0, 
                /* 0610 */    0x10, 0xF8, 0x00, 0x5A, 0x9D, 0x1D, 0x39, 0x9F, 
                /* 0618 */    0x9C, 0x13, 0x6E, 0xBC, 0x7C, 0x4C, 0xD8, 0x01, 
                /* 0620 */    0xF0, 0xE0, 0x4B, 0xF2, 0x59, 0x84, 0xC6, 0x58, 
                /* 0628 */    0xBE, 0x8F, 0x23, 0x80, 0x9C, 0x49, 0x3C, 0x81, 
                /* 0630 */    0x44, 0x78, 0x19, 0x09, 0x12, 0xE2, 0x58, 0x5E, 
                /* 0638 */    0x43, 0x0C, 0x12, 0xE3, 0xED, 0xC8, 0xC7, 0x11, 
                /* 0640 */    0x0E, 0xF3, 0x4C, 0x62, 0xB8, 0x87, 0x83, 0x57, 
                /* 0648 */    0x91, 0x17, 0x12, 0xC3, 0x3C, 0x8A, 0xF8, 0x7C, 
                /* 0650 */    0x10, 0xC3, 0x98, 0xA1, 0xA2, 0x9D, 0x80, 0x8F, 
                /* 0658 */    0x23, 0xEC, 0x58, 0xE9, 0xA1, 0xFA, 0x38, 0x02, 
                /* 0660 */    0x58, 0xFA, 0xFF, 0x1F, 0x47, 0x80, 0xF9, 0x11, 
                /* 0668 */    0x01, 0x77, 0xDA, 0x80, 0x7B, 0x9F, 0x08, 0xF1, 
                /* 0670 */    0xA4, 0xF1, 0x92, 0xF0, 0xAC, 0x01, 0x5C, 0x84, 
                /* 0678 */    0x6A, 0x39, 0xF7, 0xB0, 0x34, 0x8F, 0x01, 0x1D, 
                /* 0680 */    0xCF, 0x38, 0x87, 0x35, 0x01, 0x69, 0x98, 0xFC, 
                /* 0688 */    0xCA, 0xED, 0x73, 0xC1, 0xD9, 0x3D, 0x72, 0x1B, 
                /* 0690 */    0x26, 0xC8, 0x13, 0xC1, 0x6B, 0x94, 0xC1, 0x05, 
                /* 0698 */    0xA9, 0xF3, 0x23, 0x4F, 0x4F, 0x21, 0xDD, 0x27, 
                /* 06A0 */    0x5A, 0x94, 0xD2, 0x63, 0x1A, 0x05, 0xF1, 0x19, 
                /* 06A8 */    0xC1, 0x21, 0xCE, 0x31, 0xE8, 0xE1, 0x7B, 0x0E, 
                /* 06B0 */    0x67, 0x74, 0x20, 0xEF, 0x01, 0xEC, 0xFE, 0x08, 
                /* 06B8 */    0x3C, 0x4F, 0x3A, 0x78, 0x74, 0xDF, 0x14, 0xCE, 
                /* 06C0 */    0xF3, 0x4C, 0xFF, 0xFF, 0x47, 0x04, 0xDE, 0x99, 
                /* 06C8 */    0xFA, 0x82, 0x09, 0x9C, 0x43, 0xDC, 0x05, 0x50, 
                /* 06D0 */    0xB2, 0xEF, 0x02, 0x14, 0xC4, 0x13, 0xF3, 0xD5, 
                /* 06D8 */    0x0F, 0x0E, 0xFE, 0xAB, 0x1F, 0x30, 0xB9, 0x2C, 
                /* 06E0 */    0xF8, 0x9A, 0x04, 0xBE, 0x53, 0x3F, 0xFE, 0xC2, 
                /* 06E8 */    0xE0, 0xDB, 0xC0, 0xC3, 0x13, 0x1B, 0x14, 0xF8, 
                /* 06F0 */    0xA1, 0x7C, 0x3D, 0x04, 0xFF, 0xFF, 0xFF, 0x7A, 
                /* 06F8 */    0x08, 0x3C, 0x95, 0x3A, 0xB5, 0xA9, 0xF0, 0x7A, 
                /* 0700 */    0x08, 0xAE, 0x28, 0xD7, 0x12, 0xD4, 0xAD, 0xC9, 
                /* 0708 */    0x82, 0x80, 0x74, 0x3F, 0x7F, 0xBE, 0x31, 0xA6, 
                /* 0710 */    0xCF, 0x25, 0xF0, 0xEE, 0xA0, 0x5A, 0x95, 0xEE, 
                /* 0718 */    0x25, 0x3C, 0x38, 0x85, 0xA2, 0x1F, 0x1E, 0x50, 
                /* 0720 */    0x61, 0x0F, 0x0F, 0x14, 0xC4, 0x17, 0x23, 0xDF, 
                /* 0728 */    0x4B, 0x00, 0x0E, 0xFC, 0xFF, 0x47, 0xC4, 0x6F, 
                /* 0730 */    0xDA, 0x70, 0x8E, 0x16, 0x98, 0x19, 0x81, 0xF5, 
                /* 0738 */    0x44, 0xE0, 0x9B, 0x36, 0xE0, 0xE8, 0xE4, 0x02, 
                /* 0740 */    0x5C, 0x4E, 0x25, 0x80, 0x2B, 0xAF, 0xA7, 0x12, 
                /* 0748 */    0xFD, 0xFF, 0x4F, 0x25, 0xE0, 0xBA, 0x7B, 0x81, 
                /* 0750 */    0xE9, 0x6A, 0x72, 0x26, 0xD1, 0x82, 0xFB, 0xEE, 
                /* 0758 */    0x05, 0xF0, 0xF3, 0xFF, 0x7F, 0xF7, 0x02, 0x88, 
                /* 0760 */    0xE9, 0xF5, 0xEE, 0x05, 0xBC, 0xCE, 0x25, 0x98, 
                /* 0768 */    0xBB, 0x97, 0xFF, 0xFF, 0x77, 0x2F, 0x80, 0xFF, 
                /* 0770 */    0xFF, 0xFF, 0xBB, 0x17, 0x40, 0x96, 0x53, 0x09, 
                /* 0778 */    0xC8, 0xB2, 0x9D, 0x4A, 0xD0, 0x0A, 0xCF, 0xD1, 
                /* 0780 */    0x50, 0x27, 0x70, 0x28, 0x4F, 0x18, 0xAF, 0xEA, 
                /* 0788 */    0x09, 0xAC, 0xE7, 0xF2, 0x85, 0x52, 0x02, 0xA3, 
                /* 0790 */    0xCB, 0x17, 0xB0, 0xFB, 0xFF, 0x5F, 0xBE, 0x00, 
                /* 0798 */    0x3E, 0x04, 0xBA, 0x0B, 0xA0, 0x22, 0xDC, 0x05, 
                /* 07A0 */    0x28, 0x88, 0x2F, 0x5F, 0x80, 0x97, 0x50, 0x10, 
                /* 07A8 */    0x32, 0x72, 0x93, 0xA0, 0x97, 0x2F, 0x38, 0x17, 
                /* 07B0 */    0x07, 0xDF, 0x8F, 0x3C, 0x28, 0x78, 0xFF, 0xFF, 
                /* 07B8 */    0x41, 0xC1, 0x19, 0xCC, 0x79, 0x17, 0x7B, 0x52, 
                /* 07C0 */    0xA4, 0xD7, 0x13, 0xB8, 0x77, 0x0E, 0x8F, 0x0D, 
                /* 07C8 */    0x1C, 0xE2, 0xAE, 0x60, 0xC0, 0xDE, 0xE5, 0xED, 
                /* 07D0 */    0x04, 0x5C, 0xDA, 0xD6, 0xAE, 0xDB, 0x09, 0x2E, 
                /* 07D8 */    0xE1, 0x71, 0x1A, 0xF2, 0xF1, 0x04, 0x93, 0xE7, 
                /* 07E0 */    0x76, 0x82, 0x4A, 0x02, 0xA3, 0x2C, 0x24, 0x3A, 
                /* 07E8 */    0x42, 0x70, 0xF5, 0x37, 0x31, 0x0A, 0x62, 0x0B, 
                /* 07F0 */    0xB7, 0x13, 0x40, 0xC7, 0xFF, 0xFF, 0x76, 0x02, 
                /* 07F8 */    0xFC, 0xC7, 0x0C, 0x67, 0x44, 0xEF, 0x15, 0x86, 
                /* 0800 */    0xF4, 0x19, 0x0C, 0x98, 0x06, 0x3A, 0x82, 0xA0, 
                /* 0808 */    0x2F, 0x69, 0xD8, 0x04, 0x37, 0x10, 0x3A, 0x23, 
                /* 0810 */    0x78, 0x17, 0x10, 0xB8, 0x13, 0x83, 0x75, 0x00, 
                /* 0818 */    0x01, 0xDF, 0x59, 0x0D, 0x78, 0xFD, 0xFF, 0xCF, 
                /* 0820 */    0x6A, 0xC0, 0xF4, 0x00, 0xE0, 0xB3, 0x1A, 0xA0, 
                /* 0828 */    0xEA, 0xF6, 0x02, 0x32, 0x85, 0x36, 0x7D, 0x6A, 
                /* 0830 */    0x34, 0x6A, 0xD5, 0xA0, 0x4C, 0x8D, 0x32, 0x0D, 
                /* 0838 */    0x6A, 0xF5, 0xA9, 0xD4, 0x98, 0x31, 0xBB, 0x60, 
                /* 0840 */    0x8A, 0x71, 0x7B, 0xA2, 0x22, 0x96, 0x23, 0x10, 
                /* 0848 */    0xEB, 0xA6, 0x90, 0x91, 0xCB, 0x86, 0x41, 0x04, 
                /* 0850 */    0x64, 0xD9, 0x8B, 0x16, 0x10, 0x01, 0x11, 0x90, 
                /* 0858 */    0x85, 0xBC, 0x1B, 0x04, 0x64, 0x55, 0x20, 0x02, 
                /* 0860 */    0x72, 0x2A, 0x20, 0x1A, 0x11, 0x88, 0xC6, 0xF1, 
                /* 0868 */    0x00, 0xC4, 0xC2, 0x81, 0x08, 0xC8, 0xEA, 0x4C, 
                /* 0870 */    0x00, 0x31, 0xA9, 0x20, 0xBA, 0x43, 0x90, 0xCF, 
                /* 0878 */    0x85, 0x80, 0x2C, 0x12, 0x44, 0x40, 0xCE, 0xB8, 
                /* 0880 */    0x3E, 0x01, 0x39, 0x30, 0x88, 0x80, 0x1C, 0xF2, 
                /* 0888 */    0x1B, 0x22, 0x20, 0x47, 0x06, 0x11, 0x90, 0x05, 
                /* 0890 */    0xEB, 0x00, 0xF2, 0xFF, 0x9F, 0xA0, 0x7C, 0x10, 
                /* 0898 */    0x01, 0x39, 0x3E, 0x10, 0x15, 0xE3, 0xE3, 0xAE, 
                /* 08A0 */    0x45, 0x1F, 0x03, 0x02, 0x72, 0x2E, 0x10, 0x01, 
                /* 08A8 */    0x39, 0x07, 0x8D, 0x80, 0x9C, 0x8A, 0x42, 0x40, 
                /* 08B0 */    0x56, 0xF5, 0x76, 0x10, 0x90, 0x35, 0x82, 0x08, 
                /* 08B8 */    0xC8, 0x29, 0x81, 0x68, 0x66, 0x20, 0x2A, 0xD8, 
                /* 08C0 */    0x0A, 0x10, 0x53, 0x0F, 0x22, 0x20, 0x2B, 0xD5, 
                /* 08C8 */    0x02, 0xC4, 0x74, 0x83, 0x08, 0xC8, 0xA9, 0xBD, 
                /* 08D0 */    0x00, 0x31, 0x0D, 0xEF, 0x00, 0x01, 0x59, 0xEB, 
                /* 08D8 */    0xD3, 0x43, 0x20, 0x4E, 0x0A, 0x42, 0xB5, 0xBA, 
                /* 08E0 */    0x01, 0x61, 0x39, 0xED, 0x80, 0x30, 0x95, 0x7A, 
                /* 08E8 */    0x40, 0x58, 0x1E, 0x3F, 0x43, 0xA6, 0x20, 0x02, 
                /* 08F0 */    0xB2, 0xA2, 0x97, 0x88, 0x80, 0x2C, 0x0F, 0x44, 
                /* 08F8 */    0x40, 0x96, 0x62, 0x08, 0x88, 0x09, 0x03, 0x11, 
                /* 0900 */    0x90, 0x23, 0x01, 0xD1, 0x80, 0x40, 0x54, 0x9E, 
                /* 0908 */    0x23, 0x20, 0xA6, 0x15, 0x44, 0x40, 0x0E, 0x08, 
                /* 0910 */    0x44, 0xD3, 0x02, 0x51, 0x8D, 0xBF, 0x25, 0x01, 
                /* 0918 */    0x59, 0x30, 0x88, 0x80, 0x2C, 0xCE, 0xD2, 0x51, 
                /* 0920 */    0x80, 0x82, 0x08, 0xC8, 0x31, 0x35, 0x0D, 0x95, 
                /* 0928 */    0x82, 0x08, 0xC8, 0x42, 0x3D, 0x01, 0x31, 0xD5, 
                /* 0930 */    0x20, 0x02, 0xB2, 0x42, 0x51, 0x40, 0x4C, 0x2F, 
                /* 0938 */    0x88, 0x06, 0x49, 0x80, 0x68, 0x6E, 0x20, 0xAA, 
                /* 0940 */    0x5A, 0x15, 0x10, 0x8B, 0x00, 0x22, 0x20, 0xE7, 
                /* 0948 */    0x06, 0xA2, 0x22, 0x5C, 0x01, 0x31, 0xE9, 0x20, 
                /* 0950 */    0x02, 0x72, 0x0E, 0x20, 0xAA, 0xF9, 0x49, 0x21, 
                /* 0958 */    0x20, 0x27, 0x00, 0x11, 0x90, 0xF3, 0xDB, 0x3A, 
                /* 0960 */    0x1A, 0xD0, 0x87, 0x8E, 0x80, 0x9C, 0x00, 0x44, 
                /* 0968 */    0x40, 0x8E, 0x03, 0x44, 0xA5, 0xFB, 0x02, 0x62, 
                /* 0970 */    0x41, 0x40, 0x04, 0x64, 0x41, 0xAF, 0x11, 0x0D, 
                /* 0978 */    0x9C, 0x80, 0x08, 0xC8, 0xD1, 0x8C, 0x01, 0xB1, 
                /* 0980 */    0x9C, 0x20, 0x02, 0xFA, 0xFF, 0x1F, 0xA8, 0xBE, 
                /* 0988 */    0x22, 0x02, 0xB2, 0x52, 0x10, 0x0D, 0x9A, 0x00, 
                /* 0990 */    0xD1, 0xB4, 0x40, 0x54, 0xF1, 0x9B, 0xE4, 0xD1, 
                /* 0998 */    0x81, 0x81, 0xE8, 0x88, 0x40, 0xA4, 0x1D, 0x11, 
                /* 09A0 */    0x28, 0x88, 0x80, 0xFC, 0xFF, 0x07
            })
            Method (SPEC, 1, Serialized)
            {
                Return (AMWV)
            }

            Method (DEVP, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, DVID)
                CreateDWordField (Arg0, 0x04, PARA)
                If (LEqual (PARA, One))
                {
                    Name (T_0, Zero)
                    Store (DVID, T_0)
                    If (LEqual (T_0, 0x00010011))
                    {
                        Or (\_SB.DSAF, One, \_SB.DSAF)
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x00010013))
                        {
                            Or (\_SB.DSAF, 0x02, \_SB.DSAF)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x00010023))
                            {
                                Or (\_SB.DSAF, 0x04, \_SB.DSAF)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x00060013))
                                {
                                    Or (\_SB.DSAF, 0x08, \_SB.DSAF)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x00060015))
                                    {
                                        Or (\_SB.DSAF, 0x10, \_SB.DSAF)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x00010015))
                                        {
                                            Or (\_SB.DSAF, 0x20, \_SB.DSAF)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_0, 0x00090011))
                                            {
                                                Or (\_SB.DSAF, 0x40, \_SB.DSAF)
                                            }
                                            Else
                                            {
                                                If (LEqual (T_0, 0x00070011))
                                                {
                                                    Or (\_SB.DSAF, 0x80, \_SB.DSAF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (T_0, 0x00080013))
                                                    {
                                                        Or (\_SB.DSAF, 0x0100, \_SB.DSAF)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (T_0, 0x00010019))
                                                        {
                                                            Or (\_SB.DSAF, 0x0200, \_SB.DSAF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (T_0, 0x00010017))
                                                            {
                                                                Or (\_SB.DSAF, 0x0400, \_SB.DSAF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (T_0, 0x00050011))
                                                                {
                                                                    Or (\_SB.DSAF, 0x0800, \_SB.DSAF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (T_0, 0x00050012))
                                                                    {
                                                                        Or (\_SB.DSAF, 0x1000, \_SB.DSAF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (T_0, 0x00060017))
                                                                        {
                                                                            Or (\_SB.DSAF, 0x2000, \_SB.DSAF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (T_0, 0x00080021))
                                                                            {
                                                                                Or (\_SB.DSAF, 0x4000, \_SB.DSAF)
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (T_0, 0x00100011))
                                                                                {
                                                                                    Or (\_SB.DSAF, 0x8000, \_SB.DSAF)
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (T_0, 0x00050001))
                                                                                    {
                                                                                        Or (\_SB.DSAF, 0x00010000, \_SB.DSAF)
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (T_0, 0x00120000))
                                                                                        {
                                                                                            Or (\_SB.DSAF, 0x00020000, \_SB.DSAF)
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (T_0, 0x00120021))
                                                                                            {
                                                                                                Or (\_SB.DSAF, 0x00040000, \_SB.DSAF)
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                If (LEqual (T_0, 0x00120011))
                                                                                                {
                                                                                                    Or (\_SB.DSAF, 0x00080000, \_SB.DSAF)
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    Return (Zero)
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Else
                {
                    If (LEqual (PARA, Zero))
                    {
                        Name (T_1, Zero)
                        Store (DVID, T_1)
                        If (LEqual (T_1, 0x00010011))
                        {
                            And (\_SB.DSAF, 0xFFFFFFFFFFFFFFFE, \_SB.DSAF)
                        }
                        Else
                        {
                            If (LEqual (T_1, 0x00010013))
                            {
                                And (\_SB.DSAF, 0xFFFFFFFFFFFFFFFD, \_SB.DSAF)
                            }
                            Else
                            {
                                If (LEqual (T_1, 0x00010023))
                                {
                                    And (\_SB.DSAF, 0xFFFFFFFFFFFFFFFB, \_SB.DSAF)
                                }
                                Else
                                {
                                    If (LEqual (T_1, 0x00060013))
                                    {
                                        And (\_SB.DSAF, 0xFFFFFFFFFFFFFFF7, \_SB.DSAF)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_1, 0x00060015))
                                        {
                                            And (\_SB.DSAF, 0xFFFFFFFFFFFFFFEF, \_SB.DSAF)
                                        }
                                        Else
                                        {
                                            If (LEqual (T_1, 0x00010015))
                                            {
                                                And (\_SB.DSAF, 0xFFFFFFFFFFFFFFDF, \_SB.DSAF)
                                            }
                                            Else
                                            {
                                                If (LEqual (T_1, 0x00090011))
                                                {
                                                    And (\_SB.DSAF, 0xFFFFFFFFFFFFFFBF, \_SB.DSAF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (T_1, 0x00070011))
                                                    {
                                                        And (\_SB.DSAF, 0xFFFFFFFFFFFFFF7F, \_SB.DSAF)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (T_1, 0x00080013))
                                                        {
                                                            And (\_SB.DSAF, 0xFFFFFFFFFFFFFEFF, \_SB.DSAF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (T_1, 0x00010019))
                                                            {
                                                                And (\_SB.DSAF, 0xFFFFFFFFFFFFFDFF, \_SB.DSAF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (T_1, 0x00010017))
                                                                {
                                                                    And (\_SB.DSAF, 0xFFFFFFFFFFFFFBFF, \_SB.DSAF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (T_1, 0x00050011))
                                                                    {
                                                                        And (\_SB.DSAF, 0xFFFFFFFFFFFFF7FF, \_SB.DSAF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (T_1, 0x00050012))
                                                                        {
                                                                            And (\_SB.DSAF, 0xFFFFFFFFFFFFEFFF, \_SB.DSAF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (T_1, 0x00060017))
                                                                            {
                                                                                And (\_SB.DSAF, 0xFFFFFFFFFFFFDFFF, \_SB.DSAF)
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (T_1, 0x00080021))
                                                                                {
                                                                                    And (\_SB.DSAF, 0xFFFFFFFFFFFFBFFF, \_SB.DSAF)
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (T_1, 0x00100011))
                                                                                    {
                                                                                        And (\_SB.DSAF, 0xFFFFFFFFFFFF7FFF, \_SB.DSAF)
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (T_1, 0x00050001))
                                                                                        {
                                                                                            And (\_SB.DSAF, 0xFFFFFFFFFFFEFFFF, \_SB.DSAF)
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (T_1, 0x00120000))
                                                                                            {
                                                                                                And (\_SB.DSAF, 0xFFFFFFFFFFFDFFFF, \_SB.DSAF)
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                If (LEqual (T_1, 0x00120021))
                                                                                                {
                                                                                                    And (\_SB.DSAF, 0xFFFFFFFFFFFBFFFF, \_SB.DSAF)
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    If (LEqual (T_1, 0x00120011))
                                                                                                    {
                                                                                                        And (\_SB.DSAF, 0xFFFFFFFFFFF7FFFF, \_SB.DSAF)
                                                                                                    }
                                                                                                    Else
                                                                                                    {
                                                                                                        Return (Zero)
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Return (One)
            }

            Method (SDSP, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, ACTN)
                Return (Zero)
            }

            Method (GDSP, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, ACTN)
                Return (Zero)
            }

            Method (DEVS, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, DVID)
                CreateDWordField (Arg0, 0x04, CPAR)
                Name (T_0, Zero)
                Store (DVID, T_0)
                If (LEqual (T_0, Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (DSTS, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, DVID)
                Name (T_0, Zero)
                Store (DVID, T_0)
                If (LEqual (T_0, 0xA0000000))
                {
                    Store (One, Local0)
                }
                Else
                {
                    If (LEqual (T_0, Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                    }
                }

                And (Local0, 0x0007FFFF, Local0)
                Return (Local0)
            }

            Method (GPID, 0, Serialized)
            {
                Return (Zero)
            }

            Method (KBFT, 1, Serialized)
            {
                Return (Zero)
            }

            Method (HKEY, 0, Serialized)
            {
                Return (Zero)
            }

            Method (CFVS, 1, Serialized)
            {
            }

            Method (CFVG, 0, Serialized)
            {
            }
        }
    }

    Scope (_SB)
    {
        Name (RAMB, 0xDF59A018)
        OperationRegion (\RAMW, SystemMemory, RAMB, 0x00010000)
        Field (RAMW, ByteAcc, NoLock, Preserve)
        {
            DSAF,   256, 
            PAR0,   32, 
            PAR1,   32, 
            PAR2,   32, 
            PINX,   32, 
            PADD,   2048
        }

        Mutex (MPAR, 0x00)
        Name (ARBF, Buffer (0x10) {})
        CreateDWordField (ARBF, Zero, REAX)
        CreateDWordField (ARBF, 0x04, REBX)
        CreateDWordField (ARBF, 0x08, RECX)
        CreateDWordField (ARBF, 0x0C, REDX)
        OperationRegion (IOB2, SystemIO, SMIP, 0x02)
        Field (IOB2, ByteAcc, NoLock, Preserve)
        {
            SMIC,   8, 
            SMIS,   8
        }

        Method (ISMI, 1, Serialized)
        {
            Store (Arg0, SMIC)
        }

        Method (GMSR, 1, Serialized)
        {
            If (LEqual (Acquire (MPAR, 0xFFFF), Zero))
            {
                Store (0x80000000, PINX)
                Store (Arg0, PAR0)
                ISMI (0x90)
                Store (Arg0, RECX)
                Store (PAR1, REAX)
                Store (PAR2, REDX)
                Release (MPAR)
                Return (ARBF)
            }

            Return (Ones)
        }

        Method (SMSR, 1, Serialized)
        {
            If (LEqual (Acquire (MPAR, 0xFFFF), Zero))
            {
                CreateDWordField (Arg0, Zero, AEAX)
                CreateDWordField (Arg0, 0x04, AEBX)
                CreateDWordField (Arg0, 0x08, AECX)
                CreateDWordField (Arg0, 0x0C, AEDX)
                Store (0x80000001, PINX)
                Store (AECX, PAR0)
                Store (AEAX, PAR1)
                Store (AEDX, PAR2)
                ISMI (0x90)
                Release (MPAR)
            }

            Return (Ones)
        }

        Method (PRID, 1, Serialized)
        {
            If (LEqual (Acquire (MPAR, 0xFFFF), Zero))
            {
                Store (0x80000002, PINX)
                Store (Arg0, PAR0)
                ISMI (0x90)
                Store (PAR1, REAX)
                Store (PAR2, REDX)
                Release (MPAR)
                Return (ARBF)
            }

            Return (Ones)
        }

        Method (GPRE, 1, Serialized)
        {
            Store (Arg0, PAR0)
            Store (0x80000005, PINX)
            ISMI (0x90)
            Return (PAR0)
        }

        Method (GNVS, 1, Serialized)
        {
            Store (Arg0, PAR0)
            Store (0x80000003, PINX)
            ISMI (0x90)
            Return (PAR1)
        }

        Method (SNVS, 2, Serialized)
        {
            Store (Arg0, PAR0)
            Store (Arg1, PAR1)
            Store (0x80000004, PINX)
            ISMI (0x90)
        }

        Method (SARM, 1, Serialized)
        {
            If (LAnd (LGreater (Arg0, 0x03), LLess (Arg0, 0x06)))
            {
                ISMI (0x92)
            }
        }

        Method (GAMM, 0, Serialized)
        {
            ISMI (0x91)
        }

        Method (SAMM, 0, Serialized)
        {
            ISMI (0x92)
        }
    }

    Device (_SB.PCI0.SBRG.TPM)
    {
        Name (_HID, EisaId ("IFX0102"))
        Name (_CID, EisaId ("PNP0C31"))
        Name (_STR, Unicode ("TPM 1.2 Device"))
        Name (_UID, One)
        Name (_CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACCS,   8, 
                    Offset (0x18), 
            TSTA,   8, 
            TBCA,   8, 
                    Offset (0xF00), 
            TVID,   16, 
            TDID,   16
        }

        Method (_STA, 0, NotSerialized)
        {
            If (LEqual (VIDT, 0x8086))
            {
                Return (Zero)
            }
            Else
            {
                If (TPMF)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.SBRG.TPM)
    {
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        Method (_DSM, 4, NotSerialized)
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */    0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E, 
                        /* 0008 */    0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    }))
            {
                Name (T_0, Zero)
                Store (ToInteger (Arg2), T_0)
                If (LEqual (T_0, Zero))
                {
                    Return (Buffer (One)
                    {
                        0x7F
                    })
                }
                Else
                {
                    If (LEqual (T_0, One))
                    {
                        Return ("1.0")
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                            Store (0x12, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Store (TMF2, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (0x11, DAT)
                                Store (OFST, INQ)
                                If (LEqual (DAT, 0xFF))
                                {
                                    Return (One)
                                }

                                Store (DAT, Index (PPI1, One))
                                Return (PPI1)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x04))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (0x21, DAT)
                                        Store (OFST, INQ)
                                        Store (DAT, Index (PPI2, One))
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        Store (DAT, Index (PPI2, One))
                                        Store (0x31, DAT)
                                        Store (OFST, INQ)
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        If (LEqual (DAT, 0xFFF0))
                                        {
                                            Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xFFF1))
                                            {
                                                Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x06))
                                        {
                                            Return (Zero)
                                        }
                                        Else
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */    0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46, 
                            /* 0008 */    0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                        }))
                {
                    Name (T_1, Zero)
                    Store (ToInteger (Arg2), T_1)
                    If (LEqual (T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                            0x03
                        })
                    }
                    Else
                    {
                        If (LEqual (T_1, One))
                        {
                            Store (0x22, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                0x00
            })
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (ITPD, PCI_Config, 0xE8, 0x04)
        Field (ITPD, DWordAcc, NoLock, Preserve)
        {
                ,   15, 
            TPDI,   1
        }

        OperationRegion (TVID, SystemMemory, 0xFED40F00, 0x02)
        Field (TVID, WordAcc, NoLock, Preserve)
        {
            VIDT,   16
        }
    }

    Device (_SB.PCI0.ITPM)
    {
        Name (_HID, "INTC010")
        Name (_CID, EisaId ("PNP0C31"))
        Name (_STR, Unicode ("TPM 1.2 Device"))
        Name (_CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        OperationRegion (TPMR, SystemMemory, 0xFED40000, 0x5000)
        Field (TPMR, AnyAcc, NoLock, Preserve)
        {
            ACC0,   8
        }

        Method (_STA, 0, NotSerialized)
        {
            If (LNotEqual (ACC0, 0xFF))
            {
                If (LEqual (VIDT, 0x8086))
                {
                    If (TPMF)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */    0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E, 
                        /* 0008 */    0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    }))
            {
                Name (T_0, Zero)
                Store (ToInteger (Arg2), T_0)
                If (LEqual (T_0, Zero))
                {
                    Return (Buffer (One)
                    {
                        0x7F
                    })
                }
                Else
                {
                    If (LEqual (T_0, One))
                    {
                        Return ("1.0")
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                            Store (0x12, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Store (TMF2, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (0x11, DAT)
                                Store (OFST, INQ)
                                If (LEqual (DAT, 0xFF))
                                {
                                    Return (One)
                                }

                                Store (DAT, Index (PPI1, One))
                                Return (PPI1)
                            }
                            Else
                            {
                                If (LEqual (T_0, 0x04))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (0x21, DAT)
                                        Store (OFST, INQ)
                                        Store (DAT, Index (PPI2, One))
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        Store (DAT, Index (PPI2, One))
                                        Store (0x31, DAT)
                                        Store (OFST, INQ)
                                        If (LEqual (DAT, 0xFF))
                                        {
                                            Return (0x02)
                                        }

                                        If (LEqual (DAT, 0xFFF0))
                                        {
                                            Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xFFF1))
                                            {
                                                Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x06))
                                        {
                                            Return (Zero)
                                        }
                                        Else
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */    0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46, 
                            /* 0008 */    0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                        }))
                {
                    Name (T_1, Zero)
                    Store (ToInteger (Arg2), T_1)
                    If (LEqual (T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                            0x03
                        })
                    }
                    Else
                    {
                        If (LEqual (T_1, One))
                        {
                            Store (0x22, TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1)
                            Store (TMF1, DAT)
                            Store (OFST, INQ)
                            If (LEqual (DAT, 0xFF))
                            {
                                Return (0x02)
                            }

                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                0x00
            })
        }
    }

    Scope (_SB.PCI0.SBRG)
    {
        Method (S1RS, 1, NotSerialized)
        {
            Store (Zero, PLED)
        }

        OperationRegion (GPBX, SystemIO, GPBS, GPLN)
        Field (GPBX, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x18), 
                ,   27, 
            PLED,   1
        }
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.SBRG.SPTS (Arg0)
            \_SB.PCI0.PEX0.SPRT (Arg0)
            \_SB.PCI0.PEX1.SPRT (Arg0)
            \_SB.PCI0.PEX2.SPRT (Arg0)
            \_SB.PCI0.PEX3.SPRT (Arg0)
            \_SB.PCI0.PEX4.SPRT (Arg0)
            \_SB.PCI0.PEX5.SPRT (Arg0)
            \_SB.PCI0.PEX6.SPRT (Arg0)
            \_SB.PCI0.PEX7.SPRT (Arg0)
            \_SB.SARM (Arg0)
            \_SB.PCI0.SBRG.SIOS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.SBRG.SWAK (Arg0)
        If (\_SB.PCI0.PEX0.PMS)
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX0, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX1.PMS)
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX1, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX2.PMS)
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX2, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX3.PMS)
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX3, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX4.PMS)
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX4, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX5.PMS)
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX5, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX6.PMS)
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX6, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX7.PMS)
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX7, 0x02)
        }
        Else
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
        }

        \_SB.PCI0.SBRG.S1RS (Arg0)
        \_SB.PCI0.SBRG.SIOW (Arg0)
    }
}

