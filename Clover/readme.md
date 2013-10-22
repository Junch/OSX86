说明
===

####1. 主板是P8P67 Rev3.1, BIOS版本3602，显卡GTX460.
####2. Clover的版本是2236.
####3. drivers64UEFI目录下有以下文件  
    FSInject-64.efi
	HFSPlus-64.efi
	OsxAptioFixDrv-64.efi
	OsxFatBinaryDrv-64.efi
####4. 安装的时候选用install目录下的文件，安装完后替换正式的文件。
####5. HDEF目录中的DSDT被Patched，假冒声卡的layout-id是892(0x37C)。
插入的代码如下所示, 这次修改是依据链接[How to add HDEF to your dsdt](http://www.tonymacx86.com/audio/50697-easyguide-how-add-hdef-your-dsdt.html)。

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

