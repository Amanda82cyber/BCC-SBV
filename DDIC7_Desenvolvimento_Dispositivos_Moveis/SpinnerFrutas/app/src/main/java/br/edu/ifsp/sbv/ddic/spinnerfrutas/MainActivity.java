package br.edu.ifsp.sbv.ddic.spinnerfrutas;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private Spinner selectFruta;
    private TextView tvSelecao;
    private ImageView imgFruta;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        selectFruta = (Spinner) findViewById(R.id.selectFruta);
        tvSelecao = (TextView) findViewById(R.id.tvSelecao);
        imgFruta = (ImageView) findViewById(R.id.imgFruta);

        selectFruta.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                tvSelecao.setText("Item selecionado: " + item);

                if (item.equals("Amora")) {
                    imgFruta.setImageResource(R.drawable.amora);
                } else if(item.equals("Banana")) {
                    imgFruta.setImageResource(R.drawable.banana);
                } else if(item.equals("Caqui")) {
                    imgFruta.setImageResource(R.drawable.caqui);
                } else if(item.equals("Damasco")) {
                    imgFruta.setImageResource(R.drawable.damasco);
                } else {
                    imgFruta.setImageResource(R.drawable.ic_launcher_background);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        ArrayList<String> options = new ArrayList<>();
        options.add("Amora");
        options.add("Banana");
        options.add("Caqui");
        options.add("Damasco");

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, options);
        adapter.setDropDownViewResource(android.R.layout.select_dialog_singlechoice);
        selectFruta.setAdapter(adapter);
    }
}