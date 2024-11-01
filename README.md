# PiPiMadrid

[![Build Status](https://github.com/mmikhasenko/PiPiMadrid.jl/workflows/Test/badge.svg)](https://github.com/mmikhasenko/PiPiMadrid.jl/actions)
[![Test workflow status](https://github.com/mmikhasenko/PiPiMadrid.jl/actions/workflows/Test.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/PiPiMadrid.jl/actions/workflows/Test.yml?query=branch%3Amain)
[![Lint workflow Status](https://github.com/mmikhasenko/PiPiMadrid.jl/actions/workflows/Lint.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/PiPiMadrid.jl/actions/workflows/Lint.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/mmikhasenko/PiPiMadrid.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/mmikhasenko/PiPiMadrid.jl)
[![DOI](https://zenodo.org/badge/DOI/FIXME)](https://doi.org/FIXME)
[![BestieTemplate](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/JuliaBesties/BestieTemplate.jl/main/docs/src/assets/badge.json)](https://github.com/JuliaBesties/BestieTemplate.jl)

Julia implementation of the $\pi\pi$ scattering amplitudes from Madrid group.

1. Module `GKPY11` implements S,P, and F waves following the ["Pion-pion scattering amplitude, IV"](https://inspirehep.net/literature/889131) paper.
2. Module `PRR19` codes the S-wave from the ["Global parameterization of ππ scattering up to 2 GeV"](https://inspirehep.net/literature/1747223)

## Installation

```julia
pkg> add https://github.com/mmikhasenko/PiPiMadrid.jl.git
```

## Usage

Function `δ0`, `δ1`, and `δ2` give values of the phase shifts in S, P, and F waves, respectively, as functions of the squared mass of the $\pi\pi$ system.

Signature of each function is
```
δ0(s; pars)
```
where the parameters are set to default values given by `s_wave_pars`, `p_wave_pars`, and `f_wave_pars`.

```julia
using PiPiMadrid.GKPY11
using PiPiMadrid.PRR19
using Plots

theme(:juno, lab = "")

let
    support = (0.3, 2.0)
    plot(xlab = "m(ππ) [GeV]",
        ylab = "phase shift [rad]",
        title = "scattering phase shifts", leg = :topleft)
    plot!(e -> GKPY11.δ0(e^2), support..., label = "δ0 GPKY11", lw = 2, ls = :dash)
    plot!(e -> GKPY11.δ1(e^2), support..., label = "δ1 GPKY11", lw = 2, ls = :dash)
    plot!(e -> GKPY11.δ3(e^2), support..., label = "δ3 GPKY11", lw = 2, ls = :dash)
    vspan!([GKPY11.s_wave_pars.m_boundary3, support[2]], alpha = 0.1)
    plot!(e -> PRR19.δ0(e^2; pars = PRR19.s_wave_f0_pars), 0.3, 2.0, label = "δ0 PRR19-I", lw = 2)
end
```

![pipi_spectum](https://github.com/user-attachments/assets/18efdaed-2d38-4188-8d88-769e41755455)

## How to Cite

Please cite the original paper, [link to inspire](https://inspirehep.net/literature/889131).
You can refer to Julia implementation with a Zenodo DOI, [link to Zenodo](https://doi.org/FIXME).

