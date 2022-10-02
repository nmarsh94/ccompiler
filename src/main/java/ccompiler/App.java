package ccompiler;


import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
public class App {
    public static void main(String[] args) throws Exception {
        // create a CharStream that reads from file
        // CharStream input = CharStreams.fromFileName("src/entrada.txt");
        // CharStream input = CharStreams.fromFileName("src/llaves.txt");
        CharStream input = CharStreams.fromFileName("src/asignaciones.txt");
        // CharStream input = CharStreams.fromFileName("src/codigo.txt");

        // create a lexer that feeds off of input CharStream
        reglasLexer lexer = new reglasLexer(input);
        
        // create a buffer of tokens pulled from the lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        
        // create a parser that feeds off the tokens buffer
        reglasParser parser = new reglasParser(tokens);

        // create Listener
       // reglasBaseListener escucha = new MiListener();

        // Conecto el objeto con Listeners al parser
        //parser.addParseListener(escucha);

        // Solicito al parser que comience indicando una regla gramatical
        // En este caso la regla es el simbolo inicial
        // parser.s();
        ParseTree tree =  parser.programa();
        System.out.println(tree);
    }
}