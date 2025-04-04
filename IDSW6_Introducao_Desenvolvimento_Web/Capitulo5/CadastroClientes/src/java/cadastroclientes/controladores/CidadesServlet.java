package cadastroclientes.controladores;

import cadastroclientes.dao.CidadeDAO;
import cadastroclientes.entidades.Cidade;
import cadastroclientes.entidades.Estado;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet( name = "CidadesServlet", 
             urlPatterns = { "/processaCidades" } )
public class CidadesServlet extends HttpServlet {
    protected boolean temErrosInputs(Cidade c) {
        boolean validaNome = c.getNome().length() > 30 || c.getNome().isEmpty();
        
        return validaNome;
    }

    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        CidadeDAO dao = null;
        RequestDispatcher disp = null;

        try {

            dao = new CidadeDAO();

            if ( acao.equals( "inserir" ) ) {

                String nome = request.getParameter( "nome" );
                int idEstado = Integer.parseInt( 
                        request.getParameter( "idEstado" ) );

                Estado e = new Estado();
                e.setId( idEstado );

                Cidade c = new Cidade();
                c.setNome( nome );
                c.setEstado( e );
                
                boolean temErros = temErrosInputs(c);

                if(temErros) {
                    request.setAttribute("cidade", c);
                    
                    disp = request.getRequestDispatcher(
                            "/formularios/cidades/erro.jsp" );
                } else {
                    dao.salvar( c );

                    disp = request.getRequestDispatcher(
                            "/formularios/cidades/listagem.jsp" );
                }               

            } else if ( acao.equals( "alterar" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));
                String nome = request.getParameter( "nome" );
                int idEstado = Integer.parseInt( 
                        request.getParameter( "idEstado" ) );

                Estado e = new Estado();
                e.setId( idEstado );

                Cidade c = new Cidade();
                c.setId( id );
                c.setNome( nome );
                c.setEstado( e );
                
                boolean temErros = temErrosInputs(c);
                
                if(temErros) {
                    request.setAttribute("cidade", c);
                    
                    disp = request.getRequestDispatcher(
                            "/formularios/cidades/erro.jsp" );
                } else {
                    dao.atualizar( c );

                    disp = request.getRequestDispatcher(
                            "/formularios/cidades/listagem.jsp" );
                }                

            } else if ( acao.equals( "excluir" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));

                Cidade c = new Cidade();
                c.setId( id );

                dao.excluir( c );

                disp = request.getRequestDispatcher(
                        "/formularios/cidades/listagem.jsp" );

            } else {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                Cidade c = dao.obterPorId( id );
                request.setAttribute( "cidade", c );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/cidades/alterar.jsp" );
                } else if ( acao.equals( "prepararExclusao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/cidades/excluir.jsp" );
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
        return "CidadesServlet";
    }

}
