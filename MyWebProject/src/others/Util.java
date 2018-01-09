package others;

import java.io.IOException;
import java.util.Map;
import java.util.Objects;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Util {

	public static final String ERROR_JSP = "error.jsp";
	public static final String ERROR_1_JSP = "error_1.jsp";
	public static final String WELCOME_JSP = "welcome.jsp";

	private Util() {
	}

	public static boolean isEmptyString(String str) {
		return Objects.isNull(str) || str.length() == 0;
	}

	public static boolean isNotExistParameter(Map<String, String> parameters, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		for (Entry<String, String> parameter : parameters.entrySet()) {
			if (Util.isEmptyString(parameter.getValue())) {
				request.setAttribute(Attributes.ERROR_MESSAGE.name(),
						"There is no parameter " + parameter.getKey() + " or it is empty !");
				request.getRequestDispatcher(ERROR_JSP).forward(request, response);
				return true;
			}
		}
		return false;
	}
}
