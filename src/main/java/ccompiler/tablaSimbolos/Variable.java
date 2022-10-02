package ccompiler.tablaSimbolos;

public class Variable extends Id {
    
    public Variable() {
        super();
    }

    public Variable(String tipoDato, String nombreToken, Boolean inicializado, Boolean utilizado) {
        super(tipoDato, nombreToken, inicializado, utilizado);
    }

    @Override
    public boolean equals(Object varObj) {
        Variable var = (Variable)varObj;
        if (this.getNombreToken().equals(var.getTipoDato()) && this.getNombreToken().equals(var.getNombreToken())) {
            return true;
        }
        else
            return false;
    }

    @Override
    public String toString() {
        return this.getTipoDato() + " " + this.getNombreToken() + " " + this.isInicializado() + " " + this.isUtilizado();
    }
 
    
}
