var bdShare = bdShare || {};
bdShare._LogPool = bdShare._LogPool || [];
if (!bdShare.ApiPVLogger) {
	(function(J) {
		var F, B = F = {
			version : "1.5.2.2"
		};
		B.guid = "$BAIDU$";
		B.$$ = window[B.guid] = window[B.guid] || {
			global : {}
		};
		B.browser = B.browser || {};
		(function() {
			var N = navigator.userAgent;
			B.browser.safari = /(\d+\.\d)?(?:\.\d)?\s+safari\/?(\d+\.\d+)?/i
					.test(N)
					&& !/chrome/i.test(N) ? +(RegExp["\x241"] || RegExp["\x242"])
					: undefined
		})();
		B.browser.ie = B.ie = /msie (\d+\.\d+)/i.test(navigator.userAgent) ? (document.documentMode || +RegExp["\x241"])
				: undefined;
		B.browser.opera = /opera(\/| )(\d+(\.\d+)?)(.+?(version\/(\d+(\.\d+)?)))?/i
				.test(navigator.userAgent) ? +(RegExp["\x246"] || RegExp["\x242"])
				: undefined;
		B.dom = B.dom || {};
		(function() {
			var N = B.dom.ready = function() {
				var P = false, Q = [], T;
				if (document.addEventListener) {
					T = function() {
						document.removeEventListener("DOMContentLoaded", T,
								false);
						S()
					}
				} else {
					if (document.attachEvent) {
						T = function() {
							if (document.readyState === "complete") {
								document.detachEvent("onreadystatechange", T);
								S()
							}
						}
					}
				}
				function S() {
					if (!S.isReady) {
						S.isReady = true;
						for ( var U = 0, V = Q.length; U < V; U++) {
							Q[U]()
						}
					}
				}
				function O() {
					try {
						document.documentElement.doScroll("left")
					} catch (U) {
						setTimeout(O, 1);
						return
					}
					S()
				}
				function R() {
					if (P) {
						return
					}
					P = true;
					if (document.readyState === "complete") {
						S.isReady = true
					} else {
						if (document.addEventListener) {
							document.addEventListener("DOMContentLoaded", T,
									false);
							window.addEventListener("load", S, false)
						} else {
							if (document.attachEvent) {
								document.attachEvent("onreadystatechange", T);
								window.attachEvent("onload", S);
								var V = false;
								try {
									V = window.frameElement == null
								} catch (U) {
								}
								if (document.documentElement.doScroll && V) {
									O()
								}
							}
						}
					}
				}
				R();
				return function(U) {
					S.isReady ? U() : Q.push(U)
				}
			}();
			N.isReady = false
		})();
		F.undope = true;
		var K = {
			cite : 0,
			img : 1,
			addto : 2,
			video : 3
		};
		var L = window.location || document.location;
		var G = (function() {
			var N = [];
			return function(O) {
				var Q = "bdsharelog__" + (new Date()).getTime(), P = N[Q] = new Image();
				P.onload = (P.onerror = function() {
					N[Q] = null
				});
				P.src = O;
				P = null
			}
		})();
		var E = function(T) {
			var N = document.body.offsetWidth, P = document.body.offsetHeight, O = window.screen.availWidth, Q = window.screen.availHeight, S = [
					N, P, O, Q ].join(",");
			var R = "http://nsclick.baidu.com/v.gif?pid=307&type=3071&sc=" + S
					+ "&desturl=" + encodeURIComponent(document.referrer) + "&";
			G(R + T)
		};
		function D(P, O) {
			var N = [];
			for ( var Q in O) {
				var R = typeof O[Q];
				if ((R != "function" && R != "object") && O.hasOwnProperty(Q)) {
					N.push(P + "_" + Q + "=" + O[Q])
				}
			}
			return N.join("&")
		}
		function C() {
			var P = bdShare._LogPool || [], S = {};
			for ( var O = P.length - 1; O >= 0; O--) {
				var R = P[O], Q = S[R.key];
				if (Q) {
					Q.linkid = Q.linkid || R.api.linkid;
					Q.type = (Q.type || 0) | (R.api.type || 0)
				} else {
					S[R.key] = R.api
				}
			}
			P = [];
			for ( var N in S) {
				if (S.hasOwnProperty(N)) {
					P.push({
						key : N,
						api : S[N]
					})
				}
			}
			bdShare._LogPool = P;
			return P
		}
		function A() {
			var Q = bdShare._LogPool || [], N = Q.length;
			if (N > 0) {
				Q = C();
				N = Q.length;
				var S = [], T = "", R = null, P = [ 0, 0, 0, 0, 0, 0, 0, 0 ];
				for ( var O = 0; O < N; O++) {
					R = Q[O];
					P[K[R.key]] = 1;
					if (R.api.linkid) {
						T = R.api.linkid;
						delete R.api.linkid
					}
					S.push(D(R.key, R.api))
				}
				S.unshift("linkid=" + T);
				S.unshift("apitype=" + parseInt(P.reverse().join(""), 2));
				E(S.join("&"))
			}
		}
		var M = false;
		function H() {
			M = true;
			F.dom.ready(function() {
				setTimeout(I, 1000)
			})
		}
		var I = (function() {
			var N = 0;
			return function() {
				if (bdShare.velocity
						&& (!bdShare.velocity.mainJsLoaded || !bdShare.velocity.cssLoadEnd)
						&& N++ < 3) {
					setTimeout(I, 1000)
				} else {
					if (bdShare.velocity) {
						var O = (Math.max(bdShare.velocity.cssLoadEnd,
								bdShare.velocity.mainJsLoaded) - bdShare.velocity.start) || 0;
						var P = (bdShare.velocity.cssLoadEnd - bdShare.velocity.cssLoadStart) || 0;
						var Q = (bdShare.velocity.mainJsLoaded - bdShare.velocity.start) || 0;
						if (bdShare._LogPool.length > 0) {
							bdShare._LogPool.push({
								key : "velo",
								api : {
									load : O,
									cssload : P,
									jsLoad : Q
								}
							})
						}
					}
					A()
				}
			}
		})();
		J.ApiPVLogger = {
			add : function(O, N) {
				bdShare._LogPool.push({
					key : O,
					api : N
				})
			}
		};
		if (!M) {
			H()
		}
	})(bdShare)
};