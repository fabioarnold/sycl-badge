const microzig = @import("microzig");
const MCLK = microzig.chip.peripherals.MCLK;

pub const HsDiv = MCLK.MCLK_HSDIV__DIV;
pub const CpuDiv = MCLK.MCLK_CPUDIV__DIV;

/// To keep as consistent with documentation as possible
pub const BusClockEnable = enum(u1) {
    stopped = 0,
    enabled = 1,
};

pub const ApbMask = packed struct {
    // A
    PAC: BusClockEnable = .enabled,
    PM: BusClockEnable = .enabled,
    MCLK: BusClockEnable = .enabled,
    RSTC: BusClockEnable = .enabled,
    OSCCTRL: BusClockEnable = .enabled,
    OSC32KCTRL: BusClockEnable = .enabled,
    SUPC: BusClockEnable = .enabled,
    GCLK: BusClockEnable = .enabled,
    WDT: BusClockEnable = .enabled,
    RTC: BusClockEnable = .enabled,
    EIC: BusClockEnable = .enabled,
    FREQM: BusClockEnable = .stopped,
    SERCOM0: BusClockEnable = .stopped,
    SERCOM1: BusClockEnable = .stopped,
    TC0: BusClockEnable = .stopped,
    TC1: BusClockEnable = .stopped,

    // B
    USB: BusClockEnable = .stopped,
    DSU: BusClockEnable = .enabled,
    NVMCTRL: BusClockEnable = .enabled,
    PORT: BusClockEnable = .enabled,
    EVSYS: BusClockEnable = .stopped,
    SERCOM2: BusClockEnable = .stopped,
    SERCOM3: BusClockEnable = .stopped,
    TCC0: BusClockEnable = .stopped,
    TCC1: BusClockEnable = .stopped,
    TC2: BusClockEnable = .stopped,
    TC3: BusClockEnable = .stopped,
    RAMECC: BusClockEnable = .enabled,

    // C
    TCC2: BusClockEnable = .stopped,
    TCC3: BusClockEnable = .stopped,
    TC4: BusClockEnable = .stopped,
    TC5: BusClockEnable = .stopped,
    PDEC: BusClockEnable = .stopped,
    AC: BusClockEnable = .stopped,
    AES: BusClockEnable = .stopped,
    TRNG: BusClockEnable = .stopped,
    ICM: BusClockEnable = .stopped,
    QSPI: BusClockEnable = .enabled,
    CCL: BusClockEnable = .stopped,

    // D
    SERCOM4: BusClockEnable = .stopped,
    SERCOM5: BusClockEnable = .stopped,
    TCC4: BusClockEnable = .stopped,
    ADC0: BusClockEnable = .stopped,
    ADC1: BusClockEnable = .stopped,
    DAC: BusClockEnable = .stopped,
    I2S: BusClockEnable = .stopped,
    PCC: BusClockEnable = .stopped,
};

pub const AhbMask = packed struct {
    HPB0: BusClockEnable = .enabled,
    HPB1: BusClockEnable = .enabled,
    HPB2: BusClockEnable = .enabled,
    HPB3: BusClockEnable = .enabled,
    DSU: BusClockEnable = .enabled,
    NVMCTRL: BusClockEnable = .enabled,
    CMCC: BusClockEnable = .enabled,
    DMAC: BusClockEnable = .enabled,
    USB: BusClockEnable = .enabled,
    PAC: BusClockEnable = .enabled,
    QSPI: BusClockEnable = .enabled,
    SDHC0: BusClockEnable = .enabled,
    ICM: BusClockEnable = .enabled,
    PUKCC: BusClockEnable = .enabled,
    QSPI_2X: BusClockEnable = .enabled,
    NVMCTRL_SMEEPROM: BusClockEnable = .enabled,
    NVMCTRL_CACHE: BusClockEnable = .enabled,
};

pub fn set_apb_mask(mask: ApbMask) void {
    MCLK.APBAMASK.write(.{
        .PAC_ = @intFromEnum(mask.PAC),
        .PM_ = @intFromEnum(mask.PM),
        .MCLK_ = @intFromEnum(mask.MCLK),
        .RSTC_ = @intFromEnum(mask.RSTC),
        .OSCCTRL_ = @intFromEnum(mask.OSCCTRL),
        .OSC32KCTRL_ = @intFromEnum(mask.OSC32KCTRL),
        .SUPC_ = @intFromEnum(mask.SUPC),
        .GCLK_ = @intFromEnum(mask.GCLK),
        .WDT_ = @intFromEnum(mask.WDT),
        .RTC_ = @intFromEnum(mask.RTC),
        .EIC_ = @intFromEnum(mask.EIC),
        .FREQM_ = @intFromEnum(mask.FREQM),
        .SERCOM0_ = @intFromEnum(mask.SERCOM0),
        .SERCOM1_ = @intFromEnum(mask.SERCOM1),
        .TC0_ = @intFromEnum(mask.TC0),
        .TC1_ = @intFromEnum(mask.TC1),

        .padding = 0,
    });

    MCLK.APBBMASK.write(.{
        .USB_ = @intFromEnum(mask.USB),
        .DSU_ = @intFromEnum(mask.DSU),
        .NVMCTRL_ = @intFromEnum(mask.NVMCTRL),
        .PORT_ = @intFromEnum(mask.PORT),
        .EVSYS_ = @intFromEnum(mask.EVSYS),
        .SERCOM2_ = @intFromEnum(mask.SERCOM2),
        .SERCOM3_ = @intFromEnum(mask.SERCOM3),
        .TCC0_ = @intFromEnum(mask.TCC0),
        .TCC1_ = @intFromEnum(mask.TCC1),
        .TC2_ = @intFromEnum(mask.TC2),
        .TC3_ = @intFromEnum(mask.TC3),
        .RAMECC_ = @intFromEnum(mask.RAMECC),
        .reserved4 = 0,
        .reserved7 = 0,
        .reserved9 = 0,
        .reserved16 = 0,
        .padding = 0,
    });

    MCLK.APBCMASK.write(.{
        .TCC2_ = @intFromEnum(mask.TCC2),
        .TCC3_ = @intFromEnum(mask.TCC3),
        .TC4_ = @intFromEnum(mask.TC4),
        .TC5_ = @intFromEnum(mask.TC5),
        .PDEC_ = @intFromEnum(mask.PDEC),
        .AC_ = @intFromEnum(mask.AC),
        .AES_ = @intFromEnum(mask.AES),
        .TRNG_ = @intFromEnum(mask.TRNG),
        .ICM_ = @intFromEnum(mask.ICM),
        .QSPI_ = @intFromEnum(mask.QSPI),
        .CCL_ = @intFromEnum(mask.CCL),

        .reserved3 = 0,
        .reserved13 = 0,
        .padding = 0,
    });

    MCLK.APBDMASK.write(.{
        .SERCOM4_ = @intFromEnum(mask.SERCOM4),
        .SERCOM5_ = @intFromEnum(mask.SERCOM5),
        .TCC4_ = @intFromEnum(mask.TCC4),
        .ADC0_ = @intFromEnum(mask.ADC0),
        .ADC1_ = @intFromEnum(mask.ADC1),
        .DAC_ = @intFromEnum(mask.DAC),
        .I2S_ = @intFromEnum(mask.I2S),
        .PCC_ = @intFromEnum(mask.PCC),

        .reserved4 = 0,
        .reserved7 = 0,
        .padding = 0,
    });
}

pub fn set_ahb_mask(mask: AhbMask) void {
    MCLK.AHBMASK.write(.{
        .HPB0_ = @intFromEnum(mask.HPB0),
        .HPB1_ = @intFromEnum(mask.HPB1),
        .HPB2_ = @intFromEnum(mask.HPB2),
        .HPB3_ = @intFromEnum(mask.HPB3),
        .DSU_ = @intFromEnum(mask.DSU),
        .NVMCTRL_ = @intFromEnum(mask.NVMCTRL),
        .CMCC_ = @intFromEnum(mask.CMCC),
        .DMAC_ = @intFromEnum(mask.DMAC),
        .USB_ = @intFromEnum(mask.USB),
        .PAC_ = @intFromEnum(mask.PAC),
        .QSPI_ = @intFromEnum(mask.QSPI),
        .SDHC0_ = @intFromEnum(mask.SDHC0),
        .ICM_ = @intFromEnum(mask.ICM),
        .PUKCC_ = @intFromEnum(mask.PUKCC),
        .QSPI_2X_ = @intFromEnum(mask.QSPI_2X),
        .NVMCTRL_SMEEPROM_ = @intFromEnum(mask.NVMCTRL_SMEEPROM),
        .NVMCTRL_CACHE_ = @intFromEnum(mask.NVMCTRL_CACHE),

        // Documentation says all reserved bits should be 1 and padding is 0
        .reserved6 = 1,
        .reserved8 = 1,
        .reserved12 = 1,
        .reserved15 = 1,
        .reserved19 = 7,
        .padding = 0,
    });
}
