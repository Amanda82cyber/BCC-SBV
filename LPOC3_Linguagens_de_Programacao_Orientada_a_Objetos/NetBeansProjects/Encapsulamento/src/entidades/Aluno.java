package entidades;

/**
 * @author BV3024679
 */
public class Aluno {
    private String nome;
    private String ultimoNome;
    private int idade;
    
    // interface pública
    public void alterarIdade(int valor) {
        if(valor > 0){
           idade = valor; 
        }
    }
    
    public void alterarNome(String nome) {
        String [] nomes = nome.split(" ");
        this.nome = nomes[0];
        
        if(nomes.length > 1) {
            this.ultimoNome = nomes[1];
        }
    }
    
    public int qualSuaIdade()   {
        return idade;
    }
    
    public String qualSeuNome() {
        return nome + " " + ultimoNome;
    }
    
    public String qualSeuPrimeiroNome() {
        return nome;
    }
    
    public String qualSeuUltimoNome() {
        return ultimoNome;
    }
}
