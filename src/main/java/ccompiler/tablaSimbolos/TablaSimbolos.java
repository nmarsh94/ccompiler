package ccompiler.tablaSimbolos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Map.Entry;


public class TablaSimbolos {
    
    private LinkedList<HashMap<String,Id>> tablaSimbolos;

    public TablaSimbolos() {
        tablaSimbolos = new LinkedList<HashMap<String,Id>>();
    }

    public void enterContext(){
        HashMap<String,Id> contexto = new HashMap<String,Id>();
        this.tablaSimbolos.add(contexto);
    }

    public void salirContexto(){
        this.tablaSimbolos.removeLast();
    }

    public int getContexto(){
        return this.tablaSimbolos.size();
    }

    public HashMap<String,Id> getContextos(){
        return ((LinkedList<HashMap<String,Id>>)tablaSimbolos).getLast();
    }

    public void eliminarContexto(){
        this.tablaSimbolos.removeLast();
    }

    public void insertFunction(Id function){
        if (this.tablaSimbolos.size()>1){
            this.tablaSimbolos.get(this.tablaSimbolos.size()-2).put(function.getNombreToken(), function);
        } else{
            this.tablaSimbolos.get(this.tablaSimbolos.size()-1).put(function.getNombreToken(), function);
        }
    }

    public ArrayList<String> IdsSinUso() {
        ArrayList<String> variablesSinUso = new ArrayList<String>();

        for (Entry<String, Id> entry : tablaSimbolos.getLast().entrySet()) {
            if (!entry.getValue().isUtilizado() && !entry.getValue().getNombreToken().equals("main")) {
                if (entry.getValue() instanceof Funcion && !entry.getValue().isInicializado()) {
                    continue;
                }else{
                    variablesSinUso.add(entry.getKey());
                }
            }
        }
        return variablesSinUso;
    }

    public void agregarId(Id id) {
        this.tablaSimbolos.getLast().put(id.getNombreToken(), id);
    }

    public Id encontrarId(String nombre) {
        Id aux = tablaSimbolos.getLast().get(nombre);
        if(aux != null) {
            return aux;
        } else {
            ListIterator<HashMap<String, Id>> iterador = this.tablaSimbolos.listIterator(tablaSimbolos.size()-1);

            while (iterador.hasPrevious()) {
                aux = iterador.previous().get(nombre);
                if(aux != null) {
                    return aux;
                }
            }
        }
        return aux;
    }

    public Id encontrarIdLocal(String nombre){
        Id aux = tablaSimbolos.getLast().get(nombre);
        if(aux != null){
            return aux;
        }
        return null;
    }

    public LinkedList<HashMap<String, Id>> getTablaSimbolos() {
        return tablaSimbolos;
    }

    public void imprimirTablaSimbolo(){
        int ctx = 1;
        System.out.println("\n#### TABLA SIMBOLOS ####");
        for (HashMap<String, Id> entry : this.tablaSimbolos) {
            System.out.println("Contexto: " + ctx++ + " {");
            for(Id id : entry.values()) {
                System.out.println("    " + id.toString());
            }
            System.out.println("}");
        }
    }

    @Override
    public String toString() {
        return tablaSimbolos.toString();
    }

}
