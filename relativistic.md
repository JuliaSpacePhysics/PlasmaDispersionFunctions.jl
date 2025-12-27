# Relativistic Plasma Dispersion Function

Yes—but you should be aware up front that the **relativistic parallel integral is no longer a “one-Maxwellian–(Z(\zeta))” object**. The key reason is that (i) the independent variable should be **momentum** (p_\parallel) (not velocity), and (ii) the resonance denominator acquires **(\gamma)-dependence** through (v_\parallel(p_\parallel)) (and in the magnetized case also (\Omega_s/\gamma)). That breaks the linear-in-(v_\parallel) structure that makes the nonrelativistic (Z(\zeta)) so convenient.

Below I derive the relativistic analog as cleanly as possible, using the BO-Arbitrary nonrelativistic definition as the starting point.

---

## 1) Nonrelativistic “parallel integral” being generalized

BO-Arbitrary defines (for HH basis) the parallel integral in the form (I am paraphrasing the notation but keeping the same structure):
[
Z_{l,p}(\zeta_{sn})
;\propto;
\int_{-\infty}^{\infty}\frac{v_\parallel^{p},g_l(v_\parallel)}{\omega-k_\parallel v_\parallel-n\Omega_s},dv_\parallel,
]
where (\zeta_{sn}=(\omega-k_\parallel d_{sz}-n\Omega_s)/(k_\parallel L_{sz})) and (g_l) is the basis-weighted factor. 

This is precisely the piece that collapses to **standard (Z(\zeta))** recurrences in the nonrelativistic Maxwellian/Hermite setting. 

---

## 2) Relativistic setup: use momentum, not velocity

Relativistic Vlasov theory is naturally posed in **momentum space**:

* 4-velocity / Lorentz factor:
  [
  \gamma = \sqrt{1+\frac{p_\parallel^2+p_\perp^2}{m_s^2c^2}}
  ]
* velocity–momentum relation:
  [
  v_\parallel=\frac{p_\parallel}{\gamma m_s},\qquad v_\perp=\frac{p_\perp}{\gamma m_s}.
  ]

For a uniform (B_0), the gyrofrequency becomes
[
\Omega_s \rightarrow \Omega_s/\gamma,
]
so the magnetized resonance is
[
\omega - k_\parallel v_\parallel - n\frac{\Omega_s}{\gamma}.
]

This single (\gamma)-dependence is what fundamentally changes the analytic structure.

---

## 3) Define the relativistic analog of the BO-Arbitrary parallel integral

### 3.1 General gyrotropic case (magnetized, oblique)

Start from the same harmonic/Bessel-expanded susceptibility construction as in the nonrelativistic derivation (the harmonic denominator (\omega-k_\parallel v_\parallel-n\Omega_s) is explicit in the nonrelativistic expression). 

The relativistic replacement is:

[
\boxed{
Z^{\text{rel}}*{l,p,n};(\omega,k*\parallel; p_\perp)
;\equiv;
\int_{-\infty}^{\infty}
\frac{\left(v_\parallel\right)^{p}, \mathcal{G}*l(p*\parallel; p_\perp)}
{\omega - k_\parallel v_\parallel(p_\parallel,p_\perp) - n\Omega_s/\gamma(p_\parallel,p_\perp)}
;dp_\parallel
}
]

where:

* (v_\parallel(p_\parallel,p_\perp)=c,\dfrac{u_\parallel}{\gamma})
* (\gamma=\sqrt{1+u_\parallel^2+u_\perp^2})
* (u_{\parallel,\perp}\equiv p_{\parallel,\perp}/(m_sc))

and (\mathcal{G}_l) is whatever parallel basis “atom” you use in BO-Arbitrary (Hermite-like, GPDF-like, etc.), but now **in momentum**, not velocity.

This is the cleanest “drop-in” analog: it mirrors BO-Arbitrary’s nonrelativistic (Z_{l,p}), but with:

* (dv_\parallel \rightarrow dp_\parallel),
* (v_\parallel) nonlinear in (p_\parallel),
* (\Omega_s \rightarrow \Omega_s/\gamma).

### 3.2 Dimensionless form (often more useful)

Let
[
u_\parallel=\frac{p_\parallel}{m_sc},\quad u_\perp=\frac{p_\perp}{m_sc},\quad
\beta_\parallel=\frac{v_\parallel}{c}=\frac{u_\parallel}{\gamma}.
]
Define
[
\beta_\phi \equiv \frac{\omega}{k_\parallel c},\qquad
\alpha_n \equiv \frac{n\Omega_s}{k_\parallel c}.
]

Then the denominator becomes:
[
\omega - k_\parallel v_\parallel - n\Omega_s/\gamma
= k_\parallel c\left(\beta_\phi - \frac{u_\parallel}{\gamma} - \frac{\alpha_n}{\gamma}\right).
]

So the relativistic parallel integral can be written as:
[
\boxed{
Z^{\text{rel}}_{l,p,n}
======================

\frac{1}{k_\parallel c}
\int_{-\infty}^{\infty}
\frac{\left(\frac{u_\parallel}{\gamma}\right)^p, \tilde{\mathcal{G}}*l(u*\parallel; u_\perp)}
{\beta_\phi - \frac{u_\parallel+\alpha_n}{\gamma}}
,du_\parallel
}
]

This makes the analytic obstruction explicit: the pole condition is **implicit** in (u_\parallel) through (\gamma(u_\parallel)).

---

## 4) Rapidity substitution: the “standard” way to simplify the integral

A very useful change of variables is **rapidity**
[
u_\parallel=\sinh\eta,\qquad \gamma_\parallel=\cosh\eta,\qquad \beta_\parallel=\tanh\eta.
]

If you are doing an electrostatic/parallel case (or holding (u_\perp) fixed), this turns the velocity into a simple hyperbolic function, and the exponential Maxwell–Jüttner weight becomes especially simple.

For example, for a 1D Maxwell–Jüttner-like parallel weight (\propto e^{-\gamma_\parallel/\Theta}),
[
e^{-\gamma_\parallel/\Theta}=e^{-(\cosh\eta)/\Theta}.
]

Then (unmagnetized or (n=0)) the “relativistic (Z)-function” analog takes the canonical form:
[
\boxed{
Z^{\text{rel}}(\beta_\phi;\Theta)
;\propto;
\int_{-\infty}^{\infty}
\frac{e^{-\cosh\eta/\Theta},\mathcal{P}(\eta)}
{\beta_\phi-\tanh\eta},d\eta
}
]

For magnetized harmonics:
[
\boxed{
Z^{\text{rel}}*n(\beta*\phi;\Theta)
;\propto;
\int_{-\infty}^{\infty}
\frac{e^{-\cosh\eta/\Theta},\mathcal{P}(\eta)}
{\beta_\phi-\tanh\eta-\alpha_n/\cosh\eta},d\eta
}
]

where (\mathcal{P}(\eta)) encodes your chosen basis polynomial factors.

This is the cleanest “derived” relativistic analog: same role as (Z(\zeta)), but the denominator is no longer linear in the integration variable.

---

## 5) Weakly relativistic expansion (how you recover nonrelativistic (Z))

If (|u|\ll 1) (thermal energies (T\ll m c^2)), then:
[
\gamma \approx 1+\frac{u^2}{2},\quad
\beta_\parallel=\frac{u_\parallel}{\gamma}\approx u_\parallel\left(1-\frac{u^2}{2}\right).
]

Keeping only leading order:

* (v_\parallel \approx p_\parallel/m_s),
* (\Omega_s/\gamma \approx \Omega_s),

and the denominator reduces back to:
[
\omega - k_\parallel v_\parallel - n\Omega_s
]
so (Z^{\text{rel}}*{l,p,n}) reduces to the BO-Arbitrary nonrelativistic (Z*{l,p}) definition. 

This is the consistency check.

---

## 6) Practical implication for “BO-Arbitrary relativistic”

The nonrelativistic framework gains its eigenvalue form by turning the parallel integral into a **rational function** of (\omega) (via (Z(\zeta)) and J-pole expansions). 
In the relativistic analog above, because the resonance is not linear in the integration variable, **there is no simple closed recurrence** analogous to .

So, to make a relativistic BO-Arbitrary practical, you typically need one of these strategies:

1. **Numerical kernel + rational fit in (\omega)**: precompute the integral for complex (\omega) on a grid and fit a rational function (more expensive; tricky for damped modes).
2. **Local pole extraction**: solve the implicit pole condition for (u_\parallel) and treat it with contour methods.
3. **Weakly relativistic approximation**: expand in (\Theta=T/(mc^2)) to restore a near-(Z(\zeta)) structure.

---

## If you want the next step

Tell me which of these cases you need:

1. **Unmagnetized / electrostatic** relativistic parallel integral (simplest, no (n\Omega/\gamma)), or
2. **Magnetized oblique EM** relativistic integral (full BO-like structure).

If you specify that, I can derive a more explicit closed form (or controlled approximation) for (Z^{\text{rel}}) for a specific distribution (e.g., Maxwell–Jüttner) and show exactly what a “J-pole-like” rationalization would look like.
