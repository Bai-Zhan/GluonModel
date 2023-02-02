module GluonModel

export InitGluonModel
#export Gauss,InfraredConstant,MarisTandy,QinChang


function test()
  print("testing GluonModel.jl")
end

include(joinpath(@__DIR__,"GluonModelKernel.jl"))

function InitGluonModel(gluon_type,DL,DT,omega)
  if gluon_type == "gauss"
    GL_gauss(k2,mu)=Gauss(DL,omega,k2,mu)
    GT_gauss(k2,mu)=Gauss(DT,omega,k2,mu)
    return GL_gauss,GT_gauss
  elseif gluon_type == "infrared_constant"
    GL_IC(k2,mu)=InfraredConstant(DL,omega,k2,mu)
    GT_IC(k2,mu)=InfraredConstant(DT,omega,k2,mu)
    return GL_IC,GT_IC
  elseif gluon_type == "maris_tandy"
    GL_MT(k2,mu)=MarisTandy(DL,omega,k2,mu)
    GT_MT(k2,mu)=MarisTandy(DT,omega,k2,mu)
    return GL_MT,GT_MT
  elseif gluon_type == "qin_chang"
    GL_MT(k2,mu)=QinChang(DL,omega,k2,mu)
    GT_MT(k2,mu)=QinChang(DT,omega,k2,mu)
    return GL_MT,GT_MT
  else
    print("Wrong gluon model!")
    return Nothing
  end
end

function Gauss(D,omega,k2,mu)
  return gluon_model_kernel_MT(D,omega,k2)
end
  
function InfraredConstant(D,omega,k2,mu)
  return gluon_model_kernel_QC(D,omega,k2)
end
  
function MarisTandy(D,omega,k2,mu)
  return gluon_model_kernel_MT(D,omega,k2) + gluon_model_kernel_UV(k2)
end
  
function QinChang(D,omega,k2,mu)
  return gluon_model_kernel_QC(D,omega,k2)+gluon_model_kernel_UV(k2)
end

end
