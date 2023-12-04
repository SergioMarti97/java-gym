package org.gym.tracker.logic;

import java.util.Objects;

public class AbstractGymElement {

    protected int id = -1;

    protected String name = "";

    public AbstractGymElement() {
    }

    public AbstractGymElement(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "id " + id + " name='" + name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AbstractGymElement)) return false;
        AbstractGymElement that = (AbstractGymElement) o;
        return getId() == that.getId() && Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName());
    }

}
