package com.mycompany.domain;

/**
 * @author Fernando Molina
 * @version 1.0
 *
 */
public class BeneficialOwner {

	private long id;
	private String name;
	
	public BeneficialOwner(){
		id = 0;
	}
	
	public BeneficialOwner(long id, String name){
		this.id = id;
		this.name = name;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        return result;
    }
 
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (!(obj instanceof BeneficialOwner))
            return false;
        BeneficialOwner other = (BeneficialOwner) obj;
        if (id != other.id)
            return false;
        return true;
    }
    
    @Override
    public String toString() {
        return "Owner [id=" + id + ", name=" + name + "]";
    }
}
