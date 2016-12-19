import vibe.http.fileserver;
import vibe.http.router;
import vibe.core.log;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8084;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto router = new URLRouter;
	router.get("*", serveStaticFiles("public"));
	listenHTTP(settings, router);

	logInfo("Please open http://127.0.0.1:8084/test.htm in your browser.");
}
