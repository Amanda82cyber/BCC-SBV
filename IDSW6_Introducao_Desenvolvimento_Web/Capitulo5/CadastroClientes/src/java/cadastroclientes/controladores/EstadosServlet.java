package cadastroclientes.controladores;

import cadastroclientes.dao.EstadoDAO;
import cadastroclientes.entidades.Estado;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet( name = "EstadosServlet", 
             urlPatterns = { "/processaEstados" } )
public class EstadosServlet extends HttpServlet {
    protected boolean temErrosInputs(Estado e) {
        boolean validaNome = e.getNome().length() > 30 || e.getNome().isEmpty();
        boolean validaSigla = e.getSigla().length() > 2 || e.getSigla().isEmpty();
        
        return (validaNome || validaSigla);
    }
    
    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        EstadoDAO dao = null;
        RequestDispatcher disp = null;

        try {

            dao = new EstadoDAO();

            if ( acao.equals( "inserir" ) ) {

                String nome = request.getParameter( "nome" );
                String sigla = request.getParameter( "sigla" );

                Estado e = new Estado();
                e.setNome( nome );
                e.setSigla( sigla );
                
                boolean temErros = temErrosInputs(e);
                                
                if(temErros) {                   
                    request.setAttribute("estado", e);
                    
                    disp = request.getRequestDispatcher(
                            "/formularios/estados/erro.jsp" );
                } else {
                    dao.salvar( e );

                    disp = request.getRequestDispatcher(
                            "/formularios/estados/listagem.jsp" );
                }
                
            } else if ( acao.equals( "alterar" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));
                String nome = request.getParameter( "nome" );
                String sigla = request.getParameter( "sigla" );

                Estado e = new Estado();
                e.setId( id );
                e.setNome( nome );
                e.setSigla( sigla );
                
                boolean temErros = temErrosInputs(e);
                
                if(temErros) {
                    request.setAttribute( "estado", e );
                    
                    disp = request.getRequestDispatcher(
                            "/formularios/estados/erro.jsp" );
                } else {
                    dao.atualizar( e );

                    disp = request.getRequestDispatcher(
                            "/formularios/estados/listagem.jsp" );
                }               

            } else if ( acao.equals( "excluir" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));

                Estado e = new Estado();
                e.setId( id );

                dao.excluir( e );

                disp = request.getRequestDispatcher(
                        "/formularios/estados/listagem.jsp" );

            } else {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                Estado e = dao.obterPorId( id );
                request.setAttribute( "estado", e );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/estados/alterar.jsp" );
                } else if ( acao.equals( "prepararExclusao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/estados/excluir.jsp" );
                }
                
            }

        } catch ( SQLException exc ) {
            exc.printStackTrace();
        } finally {
            if ( dao != null ) {
                try {
                    dao.fecharConexao();
                } catch ( SQLException exc ) {
                    exc.printStackTrace();
                }
            }
        }

        if ( disp != null ) {            
            disp.forward( request, response );
        }
        
    }
    
    @Override
    protected void doGet( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    @Override
    protected void doPost( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    @Override
    public String getServletInfo() {
        return "EstadosServlet";
    }

}
