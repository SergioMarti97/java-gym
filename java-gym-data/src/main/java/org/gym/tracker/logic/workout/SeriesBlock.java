package org.gym.tracker.logic.workout;

import org.gym.tracker.logic.AbstractGymElement;

import java.util.ArrayList;
import java.util.List;

public class SeriesBlock extends AbstractGymElement {

    protected List<Series> series = new ArrayList<>();

    public SeriesBlock() {
    }

    public SeriesBlock(int id, String name) {
        super(id, name);
    }

    public List<Series> getSeries() {
        return series;
    }

    public int getNumSeries() {
        return series.size();
    }

}
