package com.shahroz.UniverCity.Config;


import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeIn;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.info.License;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.annotations.servers.Server;

@OpenAPIDefinition(
        info = @Info(
                contact = @Contact(
                        name = "Shahroz",
                        email = "shahrozsalman7@gmail.com"

                ),
                description = "API Specification for UniverCity",
                title = "OpenApi specification - Shahroz",
                version = "1.0",
                license = @License(
                        name = "Licended by Shahroz"
                )
        ),
        servers ={ @Server(
                description = "Local ENV",
                url = "http://localhost:8088/api/v1"
        ),
        @Server(
                description = "PROD ENV",
                url = "https://UniverCity.com"
        )
        },
        security = {
                @SecurityRequirement(
                        name = "bearerAuth"
                )
        }
)
@SecurityScheme(
        name = "bearerAuth",
        description = "JWT Auth Description",
        scheme = "bearer",
        type = SecuritySchemeType.HTTP,
        bearerFormat = "JWT",
        in = SecuritySchemeIn.HEADER
)
public class OpenApiConfig {
}
