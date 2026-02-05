# PhyCI_WS_SSB2026
Files for Participants of [Phylogenetic Causal Inference Workshop](https://ssb2026.github.io/phyloCausalInference.html) at the [2026 SSB Breakout Meeting](https://ssb2026.github.io).

### Slides_Handouts
- **PrimerPCI_SSB2026.pdf** contains the condensed/unanimated slides we presented at the workshop.
- **PCI_WS_CaseStudy_Handout.pdf** is the non-print version of the handout, with colour-versions of the figures.

### Code
- **PCI_Confounders.R** contains the code needed to simulate confounder and d-sep-logic examples used in the lecture. It also contains some extra plots to explore the data more under the different confounder scenarios.

### Readings
#### Required Readings
We will work through two case studies based on published articles.
Skim them to already have a sense of questions, story, and supporting evidence.
Focus on how methods test hypothesis conceptually, rather than technical details. 
Do you think there there is convincing evidence for causal relations?
What would you predict to see if the hypothesized causal effect was real?
- **Zedek et al. (2024)** should be a fairly straightforward read. Focus on how the hypothesis that COX mutations affect genome size is tested.
- **Marki et al. (2019)** does quite a lot of analyses to answer questions on different aspects of that system. For the workshop, focus on the hypothesis that the evolution of nectarivory led to increased rates of morphological evolution, especially diversity in body-size.
- Additionally, read a brief **excerpt from Uyeda et al (2018)**, focusing on phylogenetic pseudoreplication.

#### Optional Readings
For those who want a teaser on causal inference concepts, feel free to look at the remaining two papers.
They give a general introduction to the relevant principles, but focus on application to other fields, so their case studies may go too deep into the technical specifics for our purpose.
- **Byrnes & Dee (2025)** introduce causal inference concepts for ecology and focus on the issues of observed data and confounding (Omitted Variable Bias).
- **Barrero Guevara et al. (2024)** focus on climate and infectious diseases, but give a good introduction to basic causal principles (including the concept of pseudo-experiments) in Figure 1 and the introduction.


#### Further Reading
Relevant papers on the use of causal inference (in general, in ecology and evolution) for those who want to get further into the topic.
May get updated occasionally.
- **Uyeda et al. (2018)** Rethinking PCM - causal concepts for macroevolution
- **Alencar et al. (2024)** Ecological opportunity and trait-depedent diversification in Lizards (our own first application of causal principles)
- **von Hardenberg and Gonzalez-Voyer (2013)** Method: PPA (Phylogenetic Path Analysis) 
- **von Hardenberg and Gonzalez-Voyer (2025)** Method: PhyBaSE (Phylogenetic Bayesian Structural Equations)
- **Correia et al (2025)** Best practices for going from correlation to causation (Ecology)
- **Schrodt et al. (2025)** Advancing causal inference (Ecology: biodiversity focus)
- **Van Butsic et al. (2017)** Quasi-Experiments in Ecology
- **Liu et al. (2021)** Quasi-Experiments in Data Science
- **Attia et al. (2022)** Capturing interactions using DAGs
- **Walmsley and Morrissey (2022)** Causation not collinearity (bias in brain size evolution)


### Other Resources
- [**The Book of Why**](https://www.hachettebookgroup.com/titles/judea-pearl/the-book-of-why/9780465097616/?lens=basic-books) - A general audience introduction to the principles of causal inference and causality.
- [**Statistical Rethinking**](https://xcelab.net/rm/) - Textbook and course on Bayesian and causal statistics by Richard McElreath (some of which inspired this workshop). His class schedule and lectures are available online ([2026 version](https://github.com/rmcelreath/stat_rethinking_2026) just started in January and is [in progress](https://www.youtube.com/watch?v=sYE8a95x-0E&list=PLDcUM9US4XdNOlqSyhe38US8mFgmqzI1) , [2023/2024](https://github.com/rmcelreath/stat_rethinking_2024) version is [complete](https://www.youtube.com/watch?v=FdnMWdICdRs&list=PLDcUM9US4XdPz-KxHM4XHt7uUVGWWVSus&index=3)).
- [**Causal Inference Interest Group**](https://cls-data.github.io/CIIG/) - Multi-disciplinary online seminar series.
- [**The 100% CI**](https://www.the100.ci/) - Blog on causal and other statistics and open science.
