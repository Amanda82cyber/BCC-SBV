package edu.citadel.cvm.assembler.ast;

import edu.citadel.compiler.ConstraintException;
import edu.citadel.cvm.Constants;
import edu.citadel.cvm.OpCode;
import edu.citadel.cvm.assembler.Symbol;
import edu.citadel.cvm.assembler.Token;

import java.util.List;
import java.io.IOException;

/**
 * This class implements the abstract syntax tree for the assembly language
 * instruction LDGADDR.
 */
public class InstructionLDGADDR extends InstructionOneArg {

    public InstructionLDGADDR( List<Token> labels, Token opCode, Token arg ) {
        super( labels, opCode, arg );
    }

    public void assertOpCode() {
        assertOpCode( Symbol.LDGADDR );
    }

    public void checkArgType() throws ConstraintException {
        checkArgType( Symbol.intLiteral );
    }

    public int getArgSize() {
        return Constants.BYTES_PER_INTEGER;
    }

    @Override
    public void emit() throws IOException {
        emit( OpCode.LDGADDR );
        emit( argToInt() );
    }
}
