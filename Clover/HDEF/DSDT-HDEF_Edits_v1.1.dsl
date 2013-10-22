File: DSDT-HDEF_Edits_v1/*Line		Contents10	   DTGP44		  HDEF75    Audio ID/layout-id Table*/    Method (DTGP, 5, NotSerialized)
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
    }            Device (HDEF)
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
                                0x79, 0x03, 0x00, 0x00  /*  Example, use table below for correct layout-id */
                            }, 

                            "PinConfigurations", 
                            Buffer (Zero) {}
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }/*Audio ID/layout-id TableAudio ID   LayoutID  layout-id  dsdt layout-id Injection(dec)         (dec)        (hex)         (hex)885           885         375          0x75, 0x03, 0x00, 0x00887           887         377          0x77, 0x03, 0x00, 0x00 888           888         378          0x78, 0x03, 0x00, 0x00889           889         379          0x79, 0x03, 0x00, 0x00892           892         37C          0x7C 0x03, 0x00, 0x00898           898         382          0x82, 0x03, 0x00, 0x00               