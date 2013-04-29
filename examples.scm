(define example1 (list
  (list->vector (list
    (my-make-string "rnbqkbnrpppppppp................................PPPPPPPPRNBQKBNR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    0
    0
    0
    0
    #\.
  ))))

(define example2 (list
  (list->vector (list
    (my-make-string "rnbqkbnrpppppppp................................PPPPPPPPRNBQKBNR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    0
    0
    0
    0
    #\.
  ))
  (list->vector (list
    (my-make-string "rnbqkbnrpppppppp....................P...........PPPP.PPPRNBQKBNR")
    #\B
    (my-make-string "KQkq")
    (my-make-string "e3")
    0
    0
    4
    6
    4
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnbqkbnrpppp.ppp............p.......P...........PPPP.PPPRNBQKBNR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "e6")
    0
    0
    4
    1
    4
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnbqkbnrpppp.ppp............p.......PP..........PPPP..PPRNBQKBNR")
    #\B
    (my-make-string "KQkq")
    (my-make-string "f3")
    0
    0
    5
    6
    5
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnbqkbnrpppp.ppp....................Pp..........PPPP..PPRNBQKBNR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    4
    3
    5
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnbqkbnrpppp.ppp..................B.Pp..........PPPP..PPRNBQK.NR")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    7
    2
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrpppp.ppp..................B.Pp.q........PPPP..PPRNBQK.NR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    3
    0
    7
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrpppp.ppp..................B.Pp.q........PPPP..PPRNBQ.KNR")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    4
    7
    5
    7
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrp.pp.ppp.........p........B.Pp.q........PPPP..PPRNBQ.KNR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "b6")
    0
    0
    1
    1
    1
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrp.pp.ppp.........B..........Pp.q........PPPP..PPRNBQ.KNR")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    2
    4
    1
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.....n...B..........Pp.q........PPPP..PPRNBQ.KNR")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    6
    0
    5
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.....n...B..........Pp.q.....N..PPPP..PPRNBQ.K.R")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    6
    7
    5
    5
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.....n.q.B..........Pp.......N..PPPP..PPRNBQ.K.R")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    7
    4
    7
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.....n.q.B..........Pp.....P.N..PPP...PPRNBQ.K.R")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    3
    6
    3
    5
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.......q.B.....n....Pp.....P.N..PPP...PPRNBQ.K.R")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    2
    7
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.......q.B.....n....Pp.N...P....PPP...PPRNBQ.K.R")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    5
    7
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.........B....qn....Pp.N...P....PPP...PPRNBQ.K.R")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    7
    2
    6
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp.pp.ppp.........B...Nqn....Pp.....P....PPP...PPRNBQ.K.R")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    7
    4
    5
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp..p......B...Nqn....Pp.....P....PPP...PPRNBQ.K.R")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    2
    1
    2
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp..p......B...Nqn....PpP....P....PPP....PRNBQ.K.R")
    #\B
    (my-make-string "KQkq")
    (my-make-string "g3")
    0
    0
    6
    6
    6
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp..p..n...B...Nq.....PpP....P....PPP....PRNBQ.K.R")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    7
    3
    5
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp..p..n...B...Nq.....PpP....P....PPP....PRNBQ.KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    7
    7
    6
    7
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp.....n...p...Nq.....PpP....P....PPP....PRNBQ.KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    2
    2
    1
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp.....n...p...Nq.....PpPP...P....PPP.....RNBQ.KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "h3")
    0
    0
    7
    6
    7
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp.....nq..p...N......PpPP...P....PPP.....RNBQ.KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    6
    3
    6
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp.....nq..p...N.P....PpP....P....PPP.....RNBQ.KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    7
    4
    7
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp.....n...p...NqP....PpP....P....PPP.....RNBQ.KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    6
    2
    6
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kb.rp..p.ppp.....n...p...NqP....PpP....P.Q..PPP.....RNB..KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    3
    7
    5
    5
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrp..p.ppp.........p...NqP....PpP....P.Q..PPP.....RNB..KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    2
    6
    0
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrp..p.ppp.........p...NqP....PBP....P.Q..PPP.....RN...KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    2
    7
    5
    4
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrp..p.ppp.....q...p...N.P....PBP....P.Q..PPP.....RN...KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    6
    3
    5
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.kbnrp..p.ppp.....q...p...N.P....PBP...NP.Q..PPP.....R....KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    1
    7
    2
    5
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp.....q...pb..N.P....PBP...NP.Q..PPP.....R....KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    0
    2
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp.....q...pbN.N.P....PBP....P.Q..PPP.....R....KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    2
    5
    3
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp.........pbN.N.P....PBP....P.Q..PqP.....R....KR.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    2
    1
    6
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp...B.....pbN.N.P....P.P....P.Q..PqP.....R....KR.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    4
    3
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp...B.....p.N.N.P....P.P....P.Q..PqP.....R....Kb.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    2
    3
    6
    7
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp...B.....p.NPN.P......P....P.Q..PqP.....R....Kb.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    4
    4
    4
    3
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp...B.....p.NPN.P......P....P.Q..P.P.....q....Kb.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    1
    6
    0
    7
    #\.
  ))
  (list->vector (list
    (my-make-string "rnb.k.nrp..p.ppp...B.....p.NPN.P......P....P.Q..P.P.K...q.....b.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    7
    4
    6
    #\.
  ))
  (list->vector (list
    (my-make-string "r.b.k.nrp..p.pppn..B.....p.NPN.P......P....P.Q..P.P.K...q.....b.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    1
    0
    0
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "r.b.k.nrp..p.pNpn..B.....p.NP..P......P....P.Q..P.P.K...q.....b.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    3
    6
    1
    #\.
  ))
  (list->vector (list
    (my-make-string "r.bk..nrp..p.pNpn..B.....p.NP..P......P....P.Q..P.P.K...q.....b.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    4
    0
    3
    0
    #\.
  ))
  (list->vector (list
    (my-make-string "r.bk..nrp..p.pNpn..B.Q...p.NP..P......P....P....P.P.K...q.....b.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    5
    5
    5
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "r.bk...rp..p.pNpn..B.n...p.NP..P......P....P....P.P.K...q.....b.")
    #\W
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    6
    0
    5
    2
    #\.
  ))
  (list->vector (list
    (my-make-string "r.bk...rp..pBpNpn....n...p.NP..P......P....P....P.P.K...q.....b.")
    #\B
    (my-make-string "KQkq")
    (my-make-string "..")
    0
    0
    3
    2
    4
    1
    #\.
  ))
))

(define example3 (list
  (list->vector (list
  (my-make-string "rnbqkbnrpppppppp................................PPPPPPPPRNBQKBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  0
  0
  0
  0
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkbnrpppppppp....................P...........PPPP.PPPRNBQKBNR")
  #\B
  (my-make-string "KQkq")
  (my-make-string "e3")
  0
  0
  4
  6
  4
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkbnrppp.pppp...p................P...........PPPP.PPPRNBQKBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  3
  1
  3
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkbnrppp.pppp...p...............PP...........PPP..PPPRNBQKBNR")
  #\B
  (my-make-string "KQkq")
  (my-make-string "d3")
  0
  0
  3
  6
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkb.rppp.pppp...p.n.............PP...........PPP..PPPRNBQKBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  6
  0
  5
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkb.rppp.pppp...p.n.............PP.....N.....PPP..PPPR.BQKBNR")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  1
  7
  2
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkb.rppp.pp.p...p.np............PP.....N.....PPP..PPPR.BQKBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  6
  1
  6
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqkb.rppp.pp.p...p.np............PP.....N.B...PPP..PPPR..QKBNR")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  2
  7
  4
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqk..rppp.ppbp...p.np............PP.....N.B...PPP..PPPR..QKBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  5
  0
  6
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqk..rppp.ppbp...p.np............PP.....N.B...PPPQ.PPPR...KBNR")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  3
  7
  3
  6
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqk..rpp..ppbp..pp.np............PP.....N.B...PPPQ.PPPR...KBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  2
  1
  2
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqk..rpp..ppbp..pp.np............PP.....N.BP..PPPQ..PPR...KBNR")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  5
  6
  5
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqk..rp...ppbp..pp.np..p.........PP.....N.BP..PPPQ..PPR...KBNR")
  #\W
  (my-make-string "KQkq")
  (my-make-string "b6")
  0
  0
  1
  1
  1
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "rnbqk..rp...ppbp..pp.np..p.........PP.....N.BP..PPPQN.PPR...KB.R")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  6
  7
  4
  6
  #\.
  ))
  (list->vector (list
  (my-make-string "r.bqk..rp..nppbp..pp.np..p.........PP.....N.BP..PPPQN.PPR...KB.R")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  1
  0
  3
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "r.bqk..rp..nppbp..pp.npB.p.........PP.....N..P..PPPQN.PPR...KB.R")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  4
  5
  7
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "r.bqk..rp..npp.p..pp.npb.p.........PP.....N..P..PPPQN.PPR...KB.R")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  6
  1
  7
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "r.bqk..rp..npp.p..pp.npQ.p.........PP.....N..P..PPP.N.PPR...KB.R")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  3
  6
  7
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "r..qk..rpb.npp.p..pp.npQ.p.........PP.....N..P..PPP.N.PPR...KB.R")
  #\W
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  2
  0
  1
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "r..qk..rpb.npp.p..pp.npQ.p.........PP...P.N..P...PP.N.PPR...KB.R")
  #\B
  (my-make-string "KQkq")
  (my-make-string "..")
  0
  0
  0
  6
  0
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "r..qk..rpb.n.p.p..pp.npQ.p..p......PP...P.N..P...PP.N.PPR...KB.R")
  #\W
  (my-make-string "KQkq")
  (my-make-string "e6")
  0
  0
  4
  1
  4
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "r..qk..rpb.n.p.p..pp.npQ.p..p......PP...P.N..P...PP.N.PP..KR.B.R")
  #\B
  (my-make-string "..kq")
  (my-make-string "..")
  0
  0
  4
  7
  2
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "r...k..rpb.nqp.p..pp.npQ.p..p......PP...P.N..P...PP.N.PP..KR.B.R")
  #\W
  (my-make-string "..kq")
  (my-make-string "..")
  0
  0
  3
  0
  4
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "r...k..rpb.nqp.p..pp.npQ.p..p......PP...P.N..P...PP.N.PP.K.R.B.R")
  #\B
  (my-make-string "..kq")
  (my-make-string "..")
  0
  0
  2
  7
  1
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "r...k..r.b.nqp.pp.pp.npQ.p..p......PP...P.N..P...PP.N.PP.K.R.B.R")
  #\W
  (my-make-string "..kq")
  (my-make-string "..")
  0
  0
  0
  1
  0
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "r...k..r.b.nqp.pp.pp.npQ.p..p......PP...P.N..P...PP...PP.KNR.B.R")
  #\B
  (my-make-string "..kq")
  (my-make-string "..")
  0
  0
  4
  6
  2
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b.nqp.pp.pp.npQ.p..p......PP...P.N..P...PP...PP.KNR.B.R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  4
  0
  2
  0
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b.nqp.pp.pp.npQ.p..p......PP...PNN..P...PP...PP.K.R.B.R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  7
  1
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b.nqp.pp.pp.npQ.p.........pP...PNN..P...PP...PP.K.R.B.R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  4
  3
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b.nqp.pp.pp.npQ.p.........RP...PNN..P...PP...PP.K...B.R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  7
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b.nqp.pp..p.npQ.pp........RP...PNN..P...PP...PP.K...B.R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  2
  2
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b.nqp.pp..p.npQ.pp.........P...PNN..P...PP...PP.K.R.B.R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  4
  3
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b..qp.ppn.p.npQ.pp.........P...PNN..P...PP...PP.K.R.B.R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  1
  1
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "..kr...r.b..qp.ppn.p.npQ.pp.........P...PNN..PP..PP....P.K.R.B.R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  6
  6
  6
  5
  #\.
  ))
  (list->vector (list
  (my-make-string ".k.r...r.b..qp.ppn.p.npQ.pp.........P...PNN..PP..PP....P.K.R.B.R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  0
  1
  0
  #\.
  ))
  (list->vector (list
  (my-make-string ".k.r...r.b..qp.ppn.p.npQNpp.........P...P.N..PP..PP....P.K.R.B.R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  5
  0
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "bk.r...r....qp.ppn.p.npQNpp.........P...P.N..PP..PP....P.K.R.B.R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  1
  0
  0
  #\.
  ))
  (list->vector (list
  (my-make-string "bk.r...r....qp.ppn.p.npQNpp.........P...P.N..PPB.PP....P.K.R...R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  5
  7
  7
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "bk.r...r....qp.ppn...npQNppp........P...P.N..PPB.PP....P.K.R...R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  2
  3
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "bk.r...r....qp.ppn...np.Nppp........PQ..P.N..PPB.PP....P.K.R...R")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  7
  2
  5
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...qp.ppn...np.Nppp........PQ..P.N..PPB.PP....P.K.R...R")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  0
  0
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...qp.ppn...np.Nppp........PQ..P.N..PPB.PP....P.K.RR...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  7
  7
  4
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...qp.ppn...np.Npp........pPQ..P.N..PPB.PP....P.K.RR...")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  3
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...qp.ppn...np.NppN.......pPQ..P....PPB.PP....P.K.RR...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  5
  3
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...qp.pp....np.Nppn.......pPQ..P....PPB.PP....P.K.RR...")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  2
  3
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...qp.pp....np.NppP.......p.Q..P....PPB.PP....P.K.RR...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  4
  4
  3
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk....p.pp..q.np.NppP.......p.Q..P....PPB.PP....P.K.RR...")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  4
  1
  3
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk....p.pp..q.np.NppP.......R.Q..P....PPB.PP....P.K..R...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  7
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk....p.pp..q.np.Np.P.......p.Q..P....PPB.PP....P.K..R...")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  3
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rk...Rp.pp..q.np.Np.P.......p.Q..P....PPB.PP....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  4
  7
  4
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.ppk.q.np.Np.P.......p.Q..P....PPB.PP....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  1
  1
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.ppk.q.np.Np.P.......Q....P....PPB.PP....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  5
  4
  3
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.pp..q.np.kp.P.......Q....P....PPB.PP....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  2
  0
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.pp..q.np.kp.P.....P.Q....P....PPB..P....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "b3")
  0
  0
  1
  6
  1
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.pp..q.np..p.P....kP.Q....P....PPB..P....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  3
  0
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.pp..q.np..p.P....kP......P.Q..PPB..P....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  4
  2
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...r....Rp.pp....np..p.q....kP......P.Q..PPB..P....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  2
  3
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "b..r...rR....p.pp....np..p.q....kP......P.Q..PPB..P....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  4
  1
  0
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...rRb...p.pp....np..p.q....kP......P.Q..PPB..P....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  0
  1
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pp....np..p.q....kP......P.Q..PPB..P....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  1
  1
  1
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pp....np..p......kPq.....P.Q..PPB..P....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  3
  2
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pp....Qp..p......kPq.....P....PPB..P....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  5
  5
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pp....Qp..p.......Pq.....k....PPB..P....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  4
  0
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pQ.....p..p.......Pq.....k....PPB..P....P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  5
  2
  0
  2
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pQ.....p..p.......kq..........PPB..P....P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  5
  1
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pQ.....p..p.......kq.......P..PPB.......P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  6
  2
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.pQ.....p..p........q.......k..PPB.......P.K......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  4
  2
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.p......p..p........q.......k..PPB.......PQK......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  2
  0
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.p......p..p........q..........PPB...k...PQK......")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  5
  3
  6
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.p......p..p........q..........PPB.Q.k...P.K......")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  7
  1
  6
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.p......p..p........q..........PPB.Q.....P.K.k....")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  6
  3
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "...r...r.R...p.p......p..p........q..........PP..Q.....P.K.k.B..")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  7
  5
  5
  7
  #\.
  ))
  (list->vector (list
  (my-make-string ".......r.R...p.p......p..p........q..........PP..Q.r...P.K.k.B..")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  0
  3
  6
  #\.
  ))
  (list->vector (list
  (my-make-string ".......r...R.p.p......p..p........q..........PP..Q.r...P.K.k.B..")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  1
  3
  1
  #\.
  ))
  (list->vector (list
  (my-make-string ".......r...r.p.p......p..p........q..........PP..Q.....P.K.k.B..")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  6
  3
  1
  #\.
  ))
  (list->vector (list
  (my-make-string ".......r...r.p.p......p..p........B..........PP..Q.....P.K.k....")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  5
  7
  2
  4
  #\.
  ))
  (list->vector (list
  (my-make-string ".......r...r.p.p......p...........p..........PP..Q.....P.K.k....")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  3
  2
  4
  #\.
  ))
  (list->vector (list
  (my-make-string ".......Q...r.p.p......p...........p..........PP........P.K.k....")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  6
  7
  0
  #\.
  ))
  (list->vector (list
  (my-make-string ".......Q.....p.p......p...........p........r.PP........P.K.k....")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  1
  3
  5
  #\.
  ))
  (list->vector (list
  (my-make-string "Q............p.p......p...........p........r.PP........P.K.k....")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  7
  0
  0
  0
  #\.
  ))
  (list->vector (list
  (my-make-string "Q............p.p......p...................pr.PP........P.K.k....")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  2
  4
  2
  5
  #\.
  ))
  (list->vector (list
  (my-make-string ".............p.p......p.........Q.........pr.PP........P.K.k....")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  0
  0
  4
  #\.
  ))
  (list->vector (list
  (my-make-string ".............p.p......p.........Q.........pr.PP........P.K..k...")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  7
  4
  7
  #\.
  ))
  (list->vector (list
  (my-make-string ".............p.p......p.........Q....P....pr..P........P.K..k...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  5
  5
  5
  4
  #\.
  ))
  (list->vector (list
  (my-make-string "...............p......p......p..Q....P....pr..P........P.K..k...")
  #\W
  (my-make-string "....")
  (my-make-string "f6")
  0
  0
  5
  1
  5
  3
  #\.
  ))
  (list->vector (list
  (my-make-string "...............p......p......p..Q....P....pr..P........P..K.k...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  1
  7
  2
  7
  #\.
  ))
  (list->vector (list
  (my-make-string "...............p......p......p..Q....P....p...P....r...P..K.k...")
  #\W
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  3
  5
  3
  6
  #\.
  ))
  (list->vector (list
  (my-make-string "........Q......p......p......p.......P....p...P....r...P..K.k...")
  #\B
  (my-make-string "....")
  (my-make-string "..")
  0
  0
  0
  4
  0
  1
  #\.
  ))
))

(define example4 (list
  (list->vector (list
    (my-make-string "rnbkn..rpppp.Qpp.....b.....NN......Pp...........PPP.KP.PR.B....q")
    #\W
    (my-make-string "....")
    (my-make-string "..")
    0
    0
    0
    0
    0
    0
    #\.
  ))))

(define example5 (list
  (list->vector (list
    (my-make-string "....R.....qrbk.pR......B...p.....P.P..p...P..rP.....Q..P......K.")
    #\W
    (my-make-string "....")
    (my-make-string "..")
    0
    0
    0
    0
    0
    0
    #\.
  ))))

(define example6 (list
  (list->vector (list
    (my-make-string ".R.....rp...pk....Qp......pPBp....q....P..P..K..P....P.........R")
    #\B
    (my-make-string "....")
    (my-make-string "..")
    0
    0
    0
    0
    0
    0
    #\.
  ))))

(define example7 (list
  (list->vector (list
    (my-make-string "r..q.b.r.pN.n.ppp.n...k.....Pb....BP............PPP...PPR.BQ.RK.")
    #\W
    (my-make-string "....")
    (my-make-string "..")
    0
    0
    0
    0
    0
    0
    #\.
  ))))

(define example example2)
