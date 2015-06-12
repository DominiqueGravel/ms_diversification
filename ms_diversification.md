w% Should ecological interactions influence diversification rates ? 

% D. Gravel
% June 2015

===============================

# Background

There is an intense debate going on actually about the effect of ecological interactions on diversification rates. The current approach uses a phenomenological model to represent the effect of species diversity on the diversification rate. The model is similar to logistic growth, it assumes a maximal number of species and as species richness gets closer to this carrying capacity, the net rate of diversification decreases. It could either impact the speciation rate or the extinction rate or both. 

I find these models too phenomenological and I am unsatisfied because they do not represent interactions mechanistically. I expect that different types of interactions could lead to different diversification dynamics.  

# Objective

1. Develop a general model of network macro-evolution incorporating all types of ecological interactions and study the rates of diversification. 
2. Compare the impact of different types of interactions (competition, mutualism, predation) on the net diversification rate, on the speciation rate and on the extinction rate in order to develop testable predictions. 
3. Understand the impact of network evolution on the rate of diversification.

# Model description 

## Birth-death model of diversification 

The model we consider is inspired by the theory of island biogeography. The rate of change in species diversity is a balance between speciation events and extinction events. We represent the dynamics of species richness $R$ as:

$ \frac{dR}{dt}\frac{1}{R} = S(R) - E(R) $

The equilibrium species richness is found when $S(R) = E(R)$. Typical birth-death models are species-richness independent, in that S and E are constant rates. More recent models use phenenological representation of the diversification dynamics. Such as:

$ \frac{dR}{dt}\frac{1}{R} = (s-e)(1 - \frac{R}{K}) $

Where $s$ and $e$ are baseline speciation and extinction rates, and $K$ is the maximal species richness the system can support. This approach could be sufficient to describe the dynamics of the system and test hypotheses, but it does not allow to understand the underlying ecological mechanisms fixing carrying capacity. It could not discriminate for instance the effect of various types of interactions, or if the constraints are imposed by coexistence or decreasing population size. Here we propose a general model with simple functions describing how ecological interactions could modify the speciation and extinction rates. 

Our derivation is inspired by the trophic theory of island biogeography, which introduces predator-prey interactions into the MacArthur-Wilson model of colonization and extinction dynamics. Ecological interactions are introduced with a simple assumption: predators require a prey to colonize islands and persist. If the last prey goes extinct, then there is secondary extinction of the predator. The derivation is based on the computation of the expected number of preys a predator has on the island. As a first approximation, if the island holds $R$ species and the connectance of the ecological network is $C$, then the expected number of interacting species is simply $I = CR$. Our subsequent derivation is based on this expected number of interacting species with the resident and newly speciated species. 

As a first approximation, we consider an exponential function to represent how speciation and extinction relates to the amount of local interactions. We consider a successful speciation event to be the combination of a mutation event leading to speciation and the acquisition of traits that are ecological suitable (ie. they provide preys, mutualist or minimize competition). We describe speciation and extinction as probabilities, as later we will run stochastic simulations to relax some of the assumptions of the analytical model. An exponential function approximately represents the constraint in the TTIB of finding at least one prey species. Thus, we define:

$S(R) = u_0 + u_1 e^{-\alpha I}$

and 

$E(R) = e_0 + e_1 e^{-\alpha I}$

Where $u_0$ and $e_0$ are the asymptotic speciation and extinction probabilities respectively, and $u_1-u_0$ and $e_1-e_0$ are the speciation and extinction probabilities in absence of interactions. 

There are multiple ways to parameterize those functions, for different types of interactions. These are summarized at Table 1 and the functions are illustrated at Fig. 1. In short: 

### Competition
We consider that a successful speciation event is limited by the availability of niches. At this stage we do not represent niches explicitly, but simply assume that niche space is filled asymptotically with increasing species richness. Therefore, the speciation rate is maximal at $I = 0$, $u_1-u_0 = u_{max}$ and it decreases progressively as the number of competitors increase. We consider that it saturates at $u_0 = 0$. Alternatively, competition in a given area where resources are limited, leads to a reduction in population size. Intense competition could also result in competitive exclusion. We consequently consider that the extinction probability is minimal at $I = 0$ and increases asymtotatically with $I$ to a maximal extinction probability $e_{\Inf} = e_{max}$. 

### Mutualism
We consider that newly speciated species require to find partners to establish their mutualism. As in the TTIB, the probability of finding at least one partner, and the total benefit from all partners, should increase with the expected number of interactions. We consequently consider that the speciation rate is minimal at $I = 0$, with the extreme case of obligate mutualism where $u_1-u_0 = 0$, and it saturates at the maximal speciation rate $u_0 = u_{max}$. At the opposite of competition, mutualism increases population size and reproduction success, such that the extinction rate is expected to decrease asymptotatically with the number of expected interactions. We consequently set the extinction probability in absence of interactions at the max $e_1-e_0 = e_{max}$, with the extreme case of obligate mutualism where $e_{max}=1$, and the asymptote to $e_0 = e_{min}$. This last probability is larger than 0 because extinctions independent of interactions could occur. Note this model applies to mutualistic interactions as well as ammensalism (+,0) such as the donnor control predator-prey dynamics modelled in the TTIB.

### Predator-prey interactions
Predator-prey interactions combine the negative effect of interactions described for competition with the positive effect described for mutualism. For speciation, we consider the constraint that predators need to find preys to successfully speciation. The speciation function is thus an increasing and saturating function as for mutualism. The extinction function combines two exponential relationships. The first relationship describes the increasing benefit of having multiple preys, such as modelled for mutualism. The second relationship describes the negative effect of predatory interactions, reducing density and potentially leading to extinctions. Depending on the relative importance of these two functions, the final extinction probability could be a monotonic decreasing and asymptotic function of the expected number of interactions, or alternativel it could have a fast decrease followed by an increase of the extinction rate (such as illustrated at Fig. 1e). In this last situation, there is an initial reduction of extinction probability because of beneficial preys, followed by an increase because of harmful effects of predators. 



## Simulations

In addition to the simple analytical model we run stochastic simulation with a more explicit representation of ecological interactions. The analytical model considers that all species interact similarly (they have on average the same number of interactions) and that the position of the species in the network does not influence the diversification dynamics. Previous work on the TTIB shown this approximation to be valid to understand the broad principles, but that a more realistic representation is required because beyond the generality of the diet, the trophic position and the topology of the network does influence the occupancy. Likelihood comparison of methods shown that the stochastic simulation model outperform the analytical model. In addition to these limitations, the inheritance of traits and the consequently progressive building of the network is susceptible to impact the diversification rate. For instance, in a predator-prey system, a top carnivore with trophic level 4 requires at least the presence of herbivores and inferior carnivores to establish. The probability of a successful speciation event toward a top predator will therefore increase with species richness, much later than for herbivores. 

Speciation and extinction probabilities are computed exactly as described above for the analytical model, except that $I$ is extracted from the knowledge of the interaction network. We therefore need to model the macroevolution of this network and the role of each species in it. We therefore couple the speciation-extinction model described above with a network model describing interactions as a function of a set of evolving traits for each species. We adopt the formalism of the niche model of food web interactions, extended to represent as well competitive and mutualistic interactions. 

Each species is characterized by a set of traits defining their niche. Competition, mutualistic and predator-prey interactions differ by the rules that are set to relate the optimum and the range to the niche position. For simplicity, we consider univariate competition and mutualistic networks. In both cases, species have a niche position $n_i$ and a niche range $r_i$. A species $i$ interact with other species $j$ whose niche position falls within the range $[n_i - r_i, n_i + r_i]$. In addition for predator-prey interactions, because the interactions are directed, each species has a niche position $n_i$ and an optimum $o_i$. A predator with niche position $n_i$ feeds on preys whose niche position $n_j$ falls within the range $[o_i - r_i, o_i + r_i]$.

Different rules determine sampling of traits for initial ancestral species and their mutants $m$. Initially, for all three types of interactions, niche position is drawn at random from a uniform distribution bounded between 0 and 1. For simplicity and to avoid the evolution of super generalists (there are no explicit trade-offs giving costs to generality), the range is drawn from a beta distribution with an average $\hat{r} = 0.2$ and a shape parameter $\beta_{r}$. The optimum is drawn from a beta distribution with mean $\hat{o} = \gamma_0 + \gamma_1n$ and shape parameter $\beta_{o}$. This constraint imposes a relationship inspired by the relationship between predator and prey body size. 

Mutants inherit traits from their ancestors. The niche position is drawn from the beta distribution with an average $\hat{n}_i$ and a shape parameter XXX. The shape parameter determines the spreading around the average trait value and thus control the innovation at each mutation event. This trait is the only one to evolve. The range is fixed for all three scenarios. The optimum is deterministically determined from the new niche position. 

# Results

## Graphical interpretation 

A graphical representation of the speciation and extinction curves allow one to understand the impact of different interactions on the diversification dynamics. Species richness will increase when $S(R) > E(R)$ and conversely, it will decrease when $S(R) > E(R)$. An equilibrium $\hat{R}$ exists when the two curves cross (Fig. 1). This equilibrium could be stable or unstable, dependening on the dynamics on each side of it. The arrows on Fig. 1 illustrates for the cases of competition, mutualism and predator-prey interactions the different types of equilibrium. Stability will happen if $S(R) < E(R)$ when species richness is larger than the equilibrium $\hat{R}$ (species richness decreases) and $S(R) > E(R)$ when species richness is smaller than the equilibrum. 

Competitive interactions will limit species diversification if the speciation and extinction curves cross each other (Fig. 1a,b). Given the above described assumptions for the shape of the speciation and extinction functions, we find there is only one equilibrum and it will always be stable. The consequent per species diversification rate will be a monotonic relationship with species richness. 

Mutualistic interactions on the other hand are susceptible to present unbounded diversification (Fig. 1c,d). In contrast with the competitive interactions, the speciation and the extinction curves could cross but the equilibrium species richness will be unstable. In this situation, an increase of species richness above the equilibrium will result in a speciation rate higher than the extinction rate, and so diversity will increase without boundaries. The per species net diversification rate will consequently be a positive monotonic function of species richness. Alternatively, insufficient initial species richness could lead to a collapse of the system. 

Predator-prey interactions combine the findings of both competitive and mutualistic interactions. The speciation function will essentially follow the same shape to the mutualistic function. The extinction function on the other hand could take various forms, with various outcomes. The hump-shape relationship is susceptible to cross the speciation curves twice, generating potentially two equilibrium points. The first equilibrium $\hat{R}_1$ is unstable. In this case, if species richness is below the equilibrium, speciation will be insufficient to balance extinctions and the system will collapse. If the initial species richness is larger than this point, then species richness will increase and reach the second equilibrium, which is stable. Species richness will decrease if starting from higher species richness than the second equilibrium. The shape of the extinction curve will determine wether only one or two equilibrium will be found. The shape depends on the relative rates of change of the extinction functions for the effects of prey (more preys decrease extinctions) and predators (more predators increase extinctions). If the two decay parameters $\alpha$ are similar, then the function will be a negative exponential and there will be a single stable equilibrium. Two equilibrium will be found when the positive effect of preys saturates much faster than the negative effect of predators. 

### Table 1: list of parameters
All models
- $u_{max}$
- $e_{low}$
- $e_{max}$
- $\alpha_{u}$
- $\alpha_{e-}$
- $\alpha_{e+}$

Stochastic model
- $\hat{r}$ : average range 
- $\beta_{r}$ : shape parameter for the range
- $\gamma_0$: intercept of the n-o relationship
- $\gamma_1$: slope of the n-o relationship
- $\beta_{0}$: shape parameter for the optimum
- $\beta_{n}$: shape parameter for the inheritance of niche position

## Simulations



