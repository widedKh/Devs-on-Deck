package com.w.DevsOnDeck.models;

public class DeveloperMatch {
	private Developer developer;
    private double matchingRatio;

    public DeveloperMatch(Developer developer, double matchingRatio) {
        this.developer = developer;
        this.matchingRatio = matchingRatio;
    }

    public Developer getDeveloper() {
        return developer;
    }

    public double getMatchingRatio() {
        return matchingRatio;
    }
}