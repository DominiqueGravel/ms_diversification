u  = function(u0, u1, a, I) u0 + u1*exp(-a*I)
e1 = function(e0, b, I) e0 + (1-e0)*exp(-b*I)
e2 = function(e1, e2, c, I) 1 - e2 - (1 - e1 - e2)*exp(-c*I)

quartz(width = 5, height = 6)

par(mar = c(5,6,2,1),mfrow =c(3,2))

plot_model = function(u0, u1, e0, e1, e2, a, b, c, C) {

	R = seq(0, 250, 1)
	I = C*R
	S = u(u0,u1,a,I)
	E = e1(e0,b,I) + e2(e1,e2,c,I)

	plot(R, S, type = "l", ylim = c(0,1), xlab = "Species richness", ylab = "Probability", col = "darkblue",lwd = 1.5, cex.lab = 1.25)
	lines(R, E, col = "darkred",lwd = 1.5)
	legend("topright",bty = "n", legend = c("Speciation", "Extinction"), col = c("darkblue","darkred"),lty = 1)

	plot(R, R*(S - E), type = "l", cex.lab = 1.25, xlab = "Species richness", ylab = "Diversification rate")
	abline(h = 0, lty = 3, lwd = 0.5)

}

# (-,-)
plot_model(u0 = 0, u1 = 0.5, e0 = 0, e1 = 0.1, e2 = 0.8, a=0.1, b=Inf, c=0.1, C)

# (+,-)
plot_model(u0 = 0.6, u1 = -0.4, e0 = 0., e1 = 0, e2 = 0.1, a=0.1, b=0.5, c=0.05, C)

# (+,+)
plot_model(u0 = 0.5, u1 = -0.5, e0 = 0.2, e1 = 0, e2 = 0, a=0.1, b=0.2, c=0, C)







