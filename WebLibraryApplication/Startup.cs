using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebLibraryApplication.Startup))]

namespace WebLibraryApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
