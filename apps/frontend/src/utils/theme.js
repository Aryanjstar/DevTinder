const THEME_KEY = "devtinder-theme";

const getSystemTheme = () => {
	if (typeof window === "undefined") return "light";

	const prefersDark = window.matchMedia?.("(prefers-color-scheme: dark)")?.matches;
	return prefersDark ? "dark" : "light";
};

export const getInitialTheme = () => {
	if (typeof window === "undefined") return "light";

	const stored = localStorage.getItem(THEME_KEY);
	if (stored === "light" || stored === "dark") return stored;

	return getSystemTheme();
};

export const applyTheme = (theme) => {
	if (typeof document === "undefined") return;

	const root = document.documentElement;

	// For DaisyUI
	root.setAttribute("data-theme", theme);

	// Optional: also support Tailwind `dark:` utilities if you use them
	if (theme === "dark") {
		root.classList.add("dark");
	} else {
		root.classList.remove("dark");
	}

	localStorage.setItem(THEME_KEY, theme);
};
