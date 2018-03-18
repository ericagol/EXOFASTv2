pro fithat3, debug=debug, verbose=verbose, maxsteps=maxsteps, nthin=nthin

;; default to a very short run (not well-mixed or publication quality)
if n_elements(maxsteps) eq 0 then maxsteps=100 ;; 50000
if n_elements(nthin) eq 0 then nthin=1 ;; 50
path = filepath('',root_dir=getenv('EXOFAST_PATH'),subdir=['examples','hat3'])

;; Fit using the Torres relation
exofastv2, nplanets=1, tranpath=path+'n20070428.Sloani.KepCam.dat', $
           rvpath=path+'HAT-3b.*.rv',priorfile=path+'hat3.priors', $
           prefix=path+'HAT-3b.Torres.', maxsteps=maxsteps, $
           nthin=nthin, circular=[1], fitrv=[1],fittran=[1], $
           debug=debug, verbose=verbose, /noyy, /torres

end
