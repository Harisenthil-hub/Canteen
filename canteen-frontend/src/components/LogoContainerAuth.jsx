import AmritaFullBackground from "../assets/images/background.png";
import AmritaLogoDesktop from "../assets/images/icons/amrita-full.svg"; 




export function LogoContainerAuth() {
    return (
        <div className="logo-container">
            <img src={AmritaFullBackground} alt="Amrita" />
            <div className="logo-desktop">
                <img src={AmritaLogoDesktop} alt="logo" />
            </div>

        </div>
    )
};

export default LogoContainerAuth;