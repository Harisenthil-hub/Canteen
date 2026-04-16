import FilterIcon from "../../assets/images/icons/filter.svg";
import { Link } from "react-router-dom";

export function FilterMenu({ setSelectedType }) {
    return (
        <div className="filter">
            <img src={FilterIcon} alt="filter" />

            <div className="dropdown">
                <Link onClick={()=>{setSelectedType("All")}}>All</Link>
                <Link onClick={()=>{setSelectedType("Beverages")}}>Beverages</Link>
                <Link onClick={()=>{setSelectedType("Meals")}}>Meals</Link>
                <Link onClick={()=>{setSelectedType("Snacks")}}>Snacks</Link>
                <Link onClick={()=>{setSelectedType("Special")}}>Special</Link>
            </div>
        </div>
    );
};

export default FilterMenu;