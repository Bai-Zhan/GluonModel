#const kernel_MT=1
#const kernel_QC=2
#
#const thermal_mass_on=1
#const thermal_mass_off=0
#
#const uv_tail_off=0
#const uv_tail_on =1
#
#const damping_off=0
#const damping_ch=1
#const damping_bz=2
#
#struct ModelType
#  kernel
#  thermal_mass
#  uv_tail
#  damping
#end
#
##module GluonModelType
##  module KernelType
##    export kernel_type
##    abstract type kernel_type end
##    struct MT<: kernel_type end
##    struct QC<: kernel_type end
##  end
##
##  module ThermalMassType
##    export thermal_mass_type
##    abstract type thermal_mass_type end
##    struct on <: thermal_mass_type end
##    struct off<: thermal_mass_type end
##  end
##
##  module UVTailType
##    export UV_tail_type
##    abstract type UV_tail_type end
##    struct on <: UV_tail_type end
##    struct off<: UV_tail_type end
##  end
##
##  module DampingType
##    export damping_type
##    abstract type damping_type end
##    struct ch <:  damping_type end
##    struct bz <:  damping_type end
##    struct off<: damping_type end
##  end
##
##  import .KernelType,.ThermalMassType,.UVTailType,.DampingType
##  struct ModelType
##    kernel::KernelType.kernel_type
##    thermal_mass::ThermalMassType.thermal_mass_type
##    tail::UVTailType.UV_tail_type
##    damping::DampingType.damping_type
##  end
##
##  const gauss()             = ModelType(KernelType.MT(),ThermalMassType.off(),UVTailType.off(),DampingType.off())
##  const infrared_constant() = ModelType(KernelType.QC(),ThermalMassType.off(),UVTailType.off(),DampingType.off())
##end
