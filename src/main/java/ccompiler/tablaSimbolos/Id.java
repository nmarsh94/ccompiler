package ccompiler.tablaSimbolos;

public abstract class Id {
    
    private String tipoDato;
    private String nombreToken;
    private Boolean inicializado;
    private Boolean utilizado;

    public Id() { }

    public Id(String tipoDato, String nombreToken, Boolean inicializado, Boolean utilizado) {
        this.tipoDato = tipoDato;
        this.nombreToken = nombreToken;
        this.inicializado = inicializado;
        this.utilizado = utilizado;
    }

    public String getTipoDato() {
        return tipoDato;
    }

    public void setTipoDato(String tipoDato) {
        this.tipoDato = tipoDato;
    }

    public String getNombreToken() {
        return nombreToken;
    }

    public void setNombreToken(String nombreToken) {
        this.nombreToken = nombreToken;
    }

    public Boolean isInicializado() {
        return inicializado;
    }

    public void setInicializado(Boolean inicializado) {
        this.inicializado = inicializado;
    }

    public Boolean isUtilizado() {
        return utilizado;
    }

    public void setUtilizado(Boolean utilizado) {
        this.utilizado = utilizado;
    }


    @Override
    public String toString() {
        return "Tipo dato=" + tipoDato + ", Nombre token=" + nombreToken + 
        ",  Utilizado=" + utilizado ;
    }

    
}
