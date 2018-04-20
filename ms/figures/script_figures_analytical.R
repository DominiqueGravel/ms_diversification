u  = function(u0, u1, a_u, I) u0 + u1*exp(-a_u*I)
e1 = function(e0, a_e1, I) e0 + (1-e0)*exp(-a_e1*I)
e2 = function(e1, e2, a_e2, I) 1 - e2 - (1 - e1 - e2)*exp(-a_e2*I)
C = 0.1

dev.new(width = 20, height = 8)

#par(mar = c(5,6,2,1),mfrow =c(3,2))
par(mar = c(5,6,2,1),mfrow = c(1,2))

#-----------------------------------------------
# FIGURE 1: Competition

C = 0.1
R = seq(0, 250, 1)
I = C*R
S = u(u0 = 0, u1 = 0.5, a_u = 0.1, I)
E = e1(e0 = 0, a_e1 = Inf, I) + e2(e1 = 0.1, e2 = 0.8, a_e2 = 0.1, I)

# Panel A

plot(R, S, type = "l", ylim = c(0,0.8), xlab = "Species richness", ylab =
"Rate", col = "darkblue", lwd = 2.5, cex.lab = 2.5, cex.axis = 2)

lines(R, E, col = "darkred",lwd = 2.5)
abline(v = 110, lty = 3, lwd = 1)

arrows(x0 = 5, y0 = 0.55 , x1 = 105, y1 = 0.55, length = 0.25, )
text(x = 110, y = 0.6, cex = 2.5, labels = "Net diversification", pos = 2)

arrows(x0 = 215, y0 = 0.55, x1 = 115, y1 = 0.55, length = 0.25, )
text(x = 125, y = 0.6, cex = 2.5, labels = "Net extinction", pos = 4)

legend("topright",bty = "n", legend = c("Speciation", "Extinction"), col =
c("darkblue","darkred"), lty = 1, lwd = 2.5, cex = 2)

# Panel B

plot(R, (S - E), type = "l", xlab = "Species richness", ylab
= "Per species diversification rate", lwd = 2.5, cex.lab = 2.5, cex.axis = 2)

abline(h = 0, lty = 3, lwd = 1)
abline(v = 110, lty = 3, lwd = 1)

dev.copy2pdf(file = 'competition.pdf')


#-----------------------------------------------
# FIGURE 2: Mutualism
par(mar = c(5,6,2,1),mfrow = c(1,2))

C = 0.1
R = seq(0, 250, 1)
I = C*R
S = u(u0 = 0.5, u1 = 0.5, a_u = 0.1, I)
E = e1(e0 = 0.2, a_e1 = 0.2, I) + e2(e1 = 0, e2 = 0, a_e2 = 0, I)

# Panel A

plot(R, S, type = "l", ylim = c(0,1), xlab = "Species richness", ylab =
"Rate", col = "darkblue", lwd = 2.5, cex.lab = 2.5, cex.axis = 2)

lines(R, E, col = "darkred",lwd = 2.5)

arrows(x0 = 85, y0 = 0.75 , x1 = 200, y1 = 0.75, length = 0.25, )
text(x = 195, y = 0.8, cex = 2.5, labels = "Net diversification", pos = 2)

legend("topright",bty = "n", legend = c("Speciation", "Extinction"), col =
c("darkblue","darkred"), lty = 1, lwd = 2.5, cex = 2)

# Panel B

plot(R, (S - E), type = "l", xlab = "Species richness", ylab
= "Per species diversification rate", lwd = 2.5, cex.lab = 2.5, cex.axis = 2)

abline(h = 0, lty = 3, lwd = 1)

dev.copy2pdf(file = 'mutualism.pdf')

#-----------------------------------------------
# FIGURE 3: Predation
par(mar = c(5,6,2,1),mfrow = c(1,2))

C = 0.1
R = seq(0, 250, 1)
I = C*R
S = u(u0 = 0.6, u1 = -0.4, a_u = 0.1, I)
E = e1(e0 = 0, a_e1 = 0.5, I) + e2(e1 = 0, e2 = 0.1, a_e2 = 0.05, I)

# Panel A

plot(R, S, type = "l", ylim = c(0,1), xlab = "Species richness", ylab =
"Rate", col = "darkblue", lwd = 2.5, cex.lab = 2.5, cex.axis = 2)

lines(R, E, col = "darkred",lwd = 2.5)
abline(v = 180, lty = 3, lwd = 1)
abline(v = 35, lty = 3, lwd = 1)

arrows(x0 = 30, y0 = 0.0 , x1 = 0, y1 = 0.0, length = 0.25, )
text(x = 35, y = 0.1, cex = 2.5, labels = "Net 
	extinct.", pos = 2)

arrows(x0 = 40, y0 = 0.0 , x1 = 175, y1 = 0.0, length = 0.25, )
text(x = 165, y = 0.1, cex = 2.5, labels = "Net diversification", pos = 2)

arrows(x0 = 250, y0 = 0.0 , x1 = 185, y1 = 0.0, length = 0.25, )
text(x = 190, y = 0.1, cex = 2.5, labels = "Net 
	extinction", pos = 4)

legend("topright",bty = "n", legend = c("Speciation", "Extinction"), col =
c("darkblue","darkred"), lty = 1, lwd = 2.5, cex = 2)

# Panel B
plot(R, (S - E), type = "l", xlab = "Species richness", ylab
= "Per species diversification rate", lwd = 2.5, cex.lab = 2.5, cex.axis = 2)

abline(h = 0, lty = 3, lwd = 1)
abline(v = 180, lty = 3, lwd = 1)
abline(v = 35, lty = 3, lwd = 1)

dev.copy2pdf(file = 'predation.pdf')
