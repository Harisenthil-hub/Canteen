import AmritaLogoCropped from "../assets/images/icons/amrita-logo-cropped.png";


export function Header() {
    return (
        <nav className="navbar">
            <div className="logo-div">
                <img src={AmritaLogoCropped} alt="amrita-logo" />
            </div>
        </nav>
    );
};