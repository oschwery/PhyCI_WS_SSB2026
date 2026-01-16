# Script to generate example data to visualise elemental confounders
# Basis is Richard McElreath's online class Statistical Rethinking 2023 Lesson 05
# Orlando Schwery 03. Nov. 2025

set.seed(1337)
library(scales)  # needed for plot transparency using `alpha`

# preset colours and number of observations
cols <- c(4, 2)  # red & blue for Z levels 0 & 1
N <- 300


#####################################
## Demonstrate elemental confounds ##
##          Slides 13-25           ##
#####################################
    # Z is binary
    # X and Y are continuous

# Fork: common cause as confounder
    # X <- Z -> Y
    Z <- rbinom(N, 1, 0.5)  # Bernoulli dist
    X <- rnorm(N, 2*Z-1)    # normal dist based on Bernoulli values
    Y <- rnorm(N, 2*Z-1)    # normal dist based on Bernoulli values

    # Plot continuous variables coloured by discrete one
    plot(X, Y, col=alpha(cols[Z+1], 1), bg=alpha(cols[Z+1], 0.65), pch=21, cex=1.25, lwd=1)
    abline(lm(Y~X), col=alpha("black", 0.5), lwd=3)
    # separate fitted lines per level of Z
    abline(lm(Y[Z==1]~X[Z==1]), col=alpha(2, 0.5), lwd=3)
    abline(lm(Y[Z==0]~X[Z==0]), col=alpha(4, 0.5), lwd=3)

    # Fit regression with and without considering Z
    naive <- lm(Y~X)
    strat <- lm(Y~X+Z)

    summary(naive)
    summary(strat)

    # optional plots to explore simulated data
    windows()  # quartz() on MacOS
    par(mfrow=c(3,2))
    hist(X)
    hist(Y)
    boxplot(X~Z, col=cols)
    boxplot(Y~Z, col=cols)

    hist(X[Z==1], col=alpha(2, 0.75), xlim=c(-4, 4), ylim=c(0, 60), xlab="X", main="Histogram of X by Z")
    hist(X[Z==0], col=alpha(4, 0.75), add=TRUE)

    hist(Y[Z==1], col=alpha(2, 0.75), xlim=c(-4, 4), ylim=c(0, 60), xlab="Y", main="Histogram of Y by Z")
    hist(Y[Z==0], col=alpha(4, 0.75), add=TRUE)


# Pipe: mediator
    # X -> Y -> Z
    X <- rnorm(N)                       # normal dist, independent
    Z <- rbinom(N, 1, (1/(1+exp(-X))))  # Bernoulli with inv-logit based on normal dist values
    Y <- rnorm(N, 2*Z-1)                # normal dist based on Bernoulli


    # Plot continuous variables coloured by discrete one
    plot(X, Y, col=alpha(cols[Z+1], 1), bg=alpha(cols[Z+1], 0.65), pch=21, cex=1.25, lwd=1)
    abline(lm(Y~X), col=alpha("black", 0.5), lwd=3)
    # separate fitted lines per level of Z
    abline(lm(Y[Z==1]~X[Z==1]), col=alpha(2, 0.5), lwd=3)
    abline(lm(Y[Z==0]~X[Z==0]), col=alpha(4, 0.5), lwd=3)

    # Fit regression with and without considering Z
    naive <- lm(Y~X)
    strat <- lm(Y~X+Z)

    summary(naive)
    summary(strat)

    # optional plots to explore simulated data
    windows()
    par(mfrow=c(3,2))
    hist(X)
    hist(Y)
    boxplot(X~Z, col=cols)
    boxplot(Y~Z, col=cols)

    hist(X[Z==1], col=alpha(2, 0.75), xlim=c(-4, 4), ylim=c(0, 60), xlab="X", main="Histogram of X by Z")
    hist(X[Z==0], col=alpha(4, 0.75), add=TRUE)

    hist(Y[Z==1], col=alpha(2, 0.75), xlim=c(-4, 4), ylim=c(0, 60), xlab="Y", main="Histogram of Y by Z")
    hist(Y[Z==0], col=alpha(4, 0.75), add=TRUE)


# Collider: common effect (upsetting...)
    X <- rnorm(N)                               # normal dist independent
    Y <- rnorm(N)                               # normal dist independent
    Z <- rbinom(N, 1, (1/(1+exp(2*-X+2*-Y-2)))) # Bernoulli informed by both normals


    # Plot continuous coloured by discrete
    plot(X, Y, col=alpha(cols[Z+1], 1), bg=alpha(cols[Z+1], 0.65), pch=21, cex=1.25, lwd=1)
    abline(lm(Y~X), col=alpha("black", 0.5), lwd=3)
    # separate fitted lines per level of Z
    abline(lm(Y[Z==1]~X[Z==1]), col=alpha(2, 0.5), lwd=3)
    abline(lm(Y[Z==0]~X[Z==0]), col=alpha(4, 0.5), lwd=3)

    # Fit regression with and without considering Z
    naive <- lm(Y~X)
    strat <- lm(Y~X+Z)

    summary(naive)
    summary(strat)

    # optional plots to explore simulated data
    windows()
    par(mfrow=c(3,2))
    hist(X)
    hist(Y)
    boxplot(X~Z, col=cols)
    boxplot(Y~Z, col=cols)

    hist(X[Z==1], col=alpha(2, 0.75), xlim=c(-4, 4), ylim=c(0, 60), xlab="X", main="Histogram of X by Z")
    hist(X[Z==0], col=alpha(4, 0.75), add=TRUE)

    hist(Y[Z==1], col=alpha(2, 0.75), xlim=c(-4, 4), ylim=c(0, 60), xlab="Y", main="Histogram of Y by Z")
    hist(Y[Z==0], col=alpha(4, 0.75), add=TRUE)




###############################
## Demonstrate d-sep concept ##
##         Slide 38          ##
###############################

# Fork like above
    # X <- Z -> Y
    Z <- rbinom(N, 1, 0.5)  # independent Bernoulli
    X <- rnorm(N, 2*Z-1)    # normal dependent on Bernoulli
    Y <- rnorm(N, 2*Z-1)    # normal dependent on Bernoulli

    naive <- lm(Y~X)
    strat <- lm(Y~X+Z)
    summary(naive)
    summary(strat)


# Fork where variables are also affecting each other directly
    # X <- Z -> Y;
    # X -> Y
    W <- rbinom(N, 1, 0.5)          # independent Bernoulli
    U <- rnorm(N, 2*W-1)            # normal dist informed by Bernoulli
    V <- rnorm(N, 2*W-1) + 0.5*U    # normal dist informed both by Bernoulli AND other normal dist

    naive <- lm(V~U)
    strat <- lm(V~U+W)
    summary(naive)
    summary(strat)


# No fork, just one variable affecting other
    #    Z
    # X -> Y
    R <- rnorm(N)           # independent normal
    S <- rnorm(N) + 0.5*R   # normal dependent on other normal
    T <- rbinom(N, 1, 0.5)  # independent Bernoulli

    naive <- lm(S~R)
    strat <- lm(S~R+T)
    summary(naive)
    summary(strat)


# combined plot
windows()
par(mfrow=c(3,1))

    plot(X, Y, col=cols[Z+1], lwd=3)
        abline(lm(Y[Z==1]~X[Z==1]), col=2, lwd=3)
        abline(lm(Y[Z==0]~X[Z==0]), col=4, lwd=3)
        abline(lm(Y~X), lwd=3)

    plot(U, V, col=cols[W+1], lwd=3, xlab="X", ylab="Y")
        abline(lm(V[W==1]~U[W==1]), col=2, lwd=3)
        abline(lm(V[W==0]~U[W==0]), col=4, lwd=3)
        abline(lm(V~U), lwd=3)

    plot(R, S, col=cols[T+1], lwd=3, xlab="X", ylab="Y")
        abline(lm(S[T==1]~R[T==1]), col=2, lwd=3)
        abline(lm(S[T==0]~R[T==0]), col=4, lwd=3)
        abline(lm(S~R), lwd=3)

