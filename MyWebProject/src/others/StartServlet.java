package others;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.ISql2;
import db.User;
import db.UserManager;

public class StartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idUser = request.getParameter("idUser");
		String nameUser = request.getParameter("nameUser");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String secondName = request.getParameter("secondName");
		String lastName = request.getParameter("lastName");
		String action = request.getParameter("action");

		Map<String, String> parameters = new LinkedHashMap<>();

		if (Objects.isNull(action)) {
			request.getRequestDispatcher("autorizationUser.jsp").forward(request, response);
		} else if (Objects.equals(action.toUpperCase(), Actions.AUTORIZATION.name().toUpperCase())
				|| Objects.equals(action.toUpperCase(), Actions.INSERT.name().toUpperCase())) {

			parameters.put("nameUser", nameUser);
			parameters.put("password", password);

			if (Objects.equals(action.toUpperCase(), Actions.AUTORIZATION.name().toUpperCase())) {

				doService(parameters, () -> UserManager.getUserByNickNameAndPassword(nameUser, password), request,
						response);
			} else { // INSERT
				parameters.put("firstName", firstName);
				parameters.put("secondName", secondName);
				parameters.put("lastName", lastName);

				doService(parameters, () -> {
					User userOld = (User) request.getSession().getAttribute(Attributes.USER.name());
					User user = new User(0, firstName, secondName, lastName, password, nameUser);
					if (Util.isEmptyString(idUser)) {
						UserManager.insertUser(user);
					} else {
						user.setIdUser(Integer.valueOf(idUser));
						UserManager.updateUser(user);
						if (user.getIdUser() == userOld.getIdUser()) {
							return user;
						}
					}
					return userOld;
				}, request, response);
			}
		} else if (Objects.equals(action.toUpperCase(), Actions.VIEW.name().toUpperCase())
				|| Objects.equals(action.toUpperCase(), Actions.UPDATE.name().toUpperCase())
				|| Objects.equals(action.toUpperCase(), Actions.DELETE.name().toUpperCase())) {
			parameters.put("idUser", idUser);
			if (!Util.isNotExistParameter(parameters, request, response)) {
				try {
					request.setAttribute(Attributes.USER.name(), UserManager.getUserById(Integer.valueOf(idUser)));
				} catch (Exception e) {
					request.setAttribute(Attributes.ERROR_MESSAGE.name(), e.getMessage());
					request.getRequestDispatcher(getErrorNameFile(e)).forward(request, response);
					return;
				}
				if (Objects.equals(action.toUpperCase(), Actions.VIEW.name().toUpperCase())) {
					request.getRequestDispatcher("showUser.jsp").forward(request, response);
				} else if (Objects.equals(action.toUpperCase(), Actions.UPDATE.name().toUpperCase())) {
					request.getRequestDispatcher("insertOrUpdateUser.jsp").forward(request, response);
				} else { // DELETE
					doService(parameters, () -> {
						UserManager.deleteUser(Integer.valueOf(idUser));
						return (User) request.getSession().getAttribute(Attributes.USER.name());
					}, request, response);
				}
			}
		} else {
			request.setAttribute(Attributes.ERROR_MESSAGE.name(), "There is no action " + action + " !");
			request.getRequestDispatcher(Util.ERROR_JSP).forward(request, response);
		}
	}

	private void doService(Map<String, String> parameters, ISql2<User> lambda, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (Util.isNotExistParameter(parameters, request, response)) {
			return;
		}
		try {
			HttpSession session = request.getSession();
			session.setAttribute(Attributes.USER.name(), lambda.get());
			request.setAttribute(Attributes.ALL_USERS.name(), UserManager.getAllUsers());
			request.getRequestDispatcher(Util.WELCOME_JSP).forward(request, response);
		} catch (Exception e) {
			request.setAttribute(Attributes.ERROR_MESSAGE.name(), e.getMessage());
			request.getRequestDispatcher(getErrorNameFile(e)).forward(request, response);
		}
	}

	private String getErrorNameFile(Exception e) {
		String nameFile;
		if (e instanceof NoDataFoundException) {
			nameFile = Util.ERROR_1_JSP;
		} else {
			nameFile = Util.ERROR_JSP;
		}
		return nameFile;
	}
}
