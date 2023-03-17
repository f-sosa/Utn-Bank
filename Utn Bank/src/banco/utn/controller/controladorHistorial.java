package banco.utn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import banco.utn.entidad.Cliente;
import banco.utn.entidad.Cuenta;
import banco.utn.entidad.Historial;
import banco.utn.negocio.NegCuentas;
import banco.utn.negocio.NegHistorial;
import banco.utn.negocio.NegPersona;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controladorHistorial {
	@Autowired
	private NegHistorial negocioHistorial;
	@Autowired
	private NegCuentas negocioCuenta;
	@Autowired
	private NegPersona negocioPersona;
	
	@RequestMapping("mostrarHistorial.html")
	public ModelAndView mostrarHistorial(String dni, String cuentaSeleccionada, HttpServletRequest request) {
		ModelAndView MV = new ModelAndView();
		ArrayList<Historial> listaHistorial = new ArrayList<Historial>();
		String Cartel="Este cliente no tiene ninguna cuenta asociada";
		List<Cuenta> cuentas = negocioCuenta.obtenerCuentasDeUsuario(dni);
		if(cuentas.size()==0) {
			MV.addObject("Cartel", Cartel);
		
			String Dnii=(String) request.getSession().getAttribute("Dni");
			String Clientelogueado=(String) request.getSession().getAttribute("Clienteelogueado");
			List<Cuenta> cuentas1 = negocioCuenta.obtenerCuentasDeUsuario(Dnii);
			Cliente cliente = negocioPersona.obtenerDatosDeUsuario(Clientelogueado);
			String resumenCuentas = "";
			
			for(Cuenta cuenta : cuentas1) {
				resumenCuentas = "<div>Nro de caja de ahorro: <b>" + cuenta.getNumCuenta() + "</b>, Moneda: <b>" + cuenta.getTipoCuenta().getNombre() + "</b>, Saldo: <b>" + cuenta.getSaldo() + "</b></div><br>";
			}
			System.out.println(resumenCuentas);
			MV.addObject("clienteLogueado", cliente);
			MV.addObject("cuentasCliente", resumenCuentas);
			MV.setViewName("mainCliente");
			return MV;
		}
		String listaCuentas = "";
		for(Cuenta cuenta : cuentas) {
			if (cuentaSeleccionada != null && cuentaSeleccionada.equals(String.valueOf(cuenta.getNumCuenta()))) {
				listaCuentas = listaCuentas + "<option selected>" + cuenta.getNumCuenta() + "</option>";
			} else {
				listaCuentas = listaCuentas + "<option>" + cuenta.getNumCuenta() + "</option>";
			}
		}
		
		if (cuentaSeleccionada != null) {
			listaHistorial = (ArrayList<Historial>)negocioHistorial.obtenerHisotrialPorCuenta(Integer.parseUnsignedInt(cuentaSeleccionada));
		} else {
			listaHistorial = (ArrayList<Historial>)negocioHistorial.obtenerHisotrialPorCuenta(cuentas.get(0).getNumCuenta());
		}
		
		MV.addObject("dni", dni);
		MV.addObject("listaCuentas", listaCuentas);
		MV.addObject("listaHistorial", listaHistorial);
		MV.setViewName("Historial");
		
		return MV;
	}
}
