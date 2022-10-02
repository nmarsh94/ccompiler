package ccompiler.tablaSimbolos;

import java.util.ArrayList;

public class Funcion extends Id {
    
    private ArrayList<Variable> parametros;

    public Funcion(){
        super();
        this.parametros = new ArrayList<Variable>();
    }


    public Funcion(String tipoDato, String nombreToken, Boolean inicializado, Boolean utilizado,
            ArrayList<Variable> parametros) {
        super(tipoDato, nombreToken, inicializado, utilizado);
        this.parametros = parametros;
    }


    public ArrayList<Variable> getParametros() {
        return parametros;
    }


    public void setParametros(ArrayList<Variable> parametros) {
        this.parametros = parametros;
    }

    public boolean mismosParametros(ArrayList<Variable> param) {
        return this.parametros.equals(param);
    }


    @Override
    public String toString() {
        return this.getTipoDato() + " " + this.getNombreToken() + "(" + this.parametros.toString() + ")";
    }

    
    
}
