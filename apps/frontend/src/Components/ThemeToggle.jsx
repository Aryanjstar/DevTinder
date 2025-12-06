import { useEffect } from "react";
import { applyTheme, getInitialTheme } from "../utils/theme";

const THEME_KEY = "devtinder-theme";

const ThemeToggle = () => {
	const [theme, setTheme] = useState("light");

	useEffect(() => {
		const initial = getInitialTheme();
		setTheme(initial);
	}, []);

	useEffect(() => {
		applyTheme(theme);
	}, [theme]);

	const toggleTheme = () => {
		setTheme((prev) => (prev === "light" ? "dark" : "light"));
	};

	return (
		<button
			onClick={toggleTheme}
			className="btn btn-ghost btn-sm flex items-center gap-2"
			aria-label="Toggle dark / light mode"
		>
			{theme === "dark" ? (
				<>
					🌙 <span className="hidden sm:inline">Dark</span>
				</>
			) : (
				<>
					☀️ <span className="hidden sm:inline">Light</span>
				</>
			)}
		</button>
	);
};

export default ThemeToggle;
