const mt = 0.5;
const Nf=4;
const GAMMA_M=12.0/(33.0-2*Nf);
const TAO=ℯ^2 - 1;
const LAMBDA_QCD=0.234;

"""
The infrared part of Maris-Tandy model.
"""
function gluon_model_kernel_MT(D,omega,s)
    return 4*pi^2/(omega^6)*D*s*exp(-s/(omega^2))
end

"""
The infrared part of Qin-Chang model.
"""
function gluon_model_kernel_QC(D,omega,s)
  return 8*pi*pi*D/(omega^4)*exp(-s/(omega^2));
end

"""
The ultra-violet tail of gluon model.
"""
function gluon_model_kernel_UV(k2)
  G_UV=(8 * pi^2 *GAMMA_M) / log(TAO + ((1 + k2 / LAMBDA_QCD / LAMBDA_QCD)^2))*(1 - exp(-k2 / 4.0 / mt / mt)) / k2;
  #G_UV=G_UV*(1-exp(-k2))/k2;// This damping factor will help to improve numerical calculation (but has no physical meaning).
  return G_UV;
end

"""
The ultra-violet tail of gluon model. Used By Fei Gao.
The extra (1-exp(-k2))/k2 term will help to improve numerical calculation (but has no physical meaning).
"""
function gluon_model_kernel_UV_GF(k2)
  G_UV=gluon_model_kernel_UV(k2);
  G_UV=G_UV*(1-exp(-k2))/k2; # This damping factor will help to improve numerical calculation (but has no physical meaning).
  return G_UV;
end