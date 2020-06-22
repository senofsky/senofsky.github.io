---
Nesting XenBlanket on AWS: My Learning Experience
---

For about a year and a half, I worked on an R&D project that involved securing
cloud platforms. We used XenBlanket, which provides a feature for migrating guest
operating systems from one Xen hypervisor to another, and put in on AWS. This facilitated the scenario of having multiple AWS EC2 instances run XenBlanket and having the guest operating system migrate when triggered by a security mechanism or timer.
Ultimately, the proof of concept was successful and I wrote a company article
about the project [here]().

This was my first job at a tech startup. Previously, I worked at Raytheon, a much large company with more established processes on an already mature product.
I joined this R&D project about halfway through its completion at this point in its lifecycle, it was a proof-of-concept prototype. No one really knew if live migrations of an operating system would work without ruining the user experience.

Research and development projects are based around taking an idea that would provide utility and identifying their possible risks. If the technology is as great as you think it is, why hasn't it already been developed? Is there some type of technical barrier preventing its realization? There may not be, but some analysis should be perform to identify an possible risk. From there, a proof-of-concept can be developed to test the idea and prove its feasibility. The proof-of-concept is not meant to be a production-ready, enterprise-level tool (something that I initially struggled with on my first R&D project, given my product background). This allows more technical debt to accrue compared to a distributed product. Furthermore, market pressures and resource constraints force the "rapid" in rapid-prototype, after all, R&D typically get slashed in times of pressure.
However, not all best practices are considered equal and it would be wise to optimize them.

## Testing

Tests should be mandatory. Whether it's a rapid-prototype or mature product, some amount of testing needs to be done. Tests for rapid-prototypes do not need to be extensive, 100% code coverage does not need to be achieved, and boundary-analysis/stress-testing isn't necessary. What is necessary, however, are basic functional tests that can be used for acceptance testing and regression testing. With rapid-prototypes, codebases are usually small and commits are applied to the master branch more frequently. At this stage of a project, there tends to be a lot of "motion", and if multiple developers are on the project, there tends to be more overlap. These combinations make it easier to introduce defects into the codebase, therefore, it is imperative to have some degree of testing to prevent regressions from creeping into the codebase

## Issue Tracking and TODOs

Anytime a TODO is added to a master branch, a corresponding issue should be open. This allows TODOs to 

## A Clean Commit History

Keeping a clean comming history requires little effort. But it does take effort.
A quality read is the 7 Efforts of a good commit message. By applying these small, but extremely useful tips, a quality commit history can be maintained and used to keep track of progress in a project. Furthermore, R&D status reports can easily be copy and pasted from the commit history.

## Stick with the Goal of Proving Feasibility
