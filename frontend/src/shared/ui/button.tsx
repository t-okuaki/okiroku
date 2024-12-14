import { forwardRef, useMemo } from "react";

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  children: React.ReactNode;
  className?: string;
  color?: "primary" | "secondary";
  size?: "xs" | "sm" | "base"; // サイズの選択肢は tailwindcss の font size の種類に合わせています。
};

// ボタンのスタイルを統一させるためのコンポーネントです。
// button コンポーネントに渡せる props はすべて本コンポーネントにも渡せます。
// DOM にアクセスする可能性があるため、forwardRef を使用しています。
export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  function Button(
    { children, className, color = "primary", size = "base", ...props },
    ref,
  ) {
    const buttonClass = useMemo(() => {
      const baseClass =
        "border inline-flex items-center justify-center rounded font-medium shadow-sm";
      const focusClass =
        "focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2";
      const disabledClass = "disabled:cursor-not-allowed disabled:opacity-50";

      const colorClass = (() => {
        switch (color) {
          case "primary":
            return "border-transparent bg-indigo-600 text-white hover:bg-indigo-700";
          case "secondary":
            return "bg-white text-indigo-600 border-indigo-600 hover:bg-indigo-50";
        }
      })();
      const sizeClass = (() => {
        switch (size) {
          case "xs":
            return "text-xs px-4 py-2";
          case "sm":
            return "text-sm px-4 py-2";
          case "base":
            return "text-base px-6 py-2";
        }
      })();

      return [
        baseClass,
        focusClass,
        disabledClass,
        colorClass,
        sizeClass,
        className,
      ].join(" ");
    }, [className, color, size]);

    return (
      <button className={buttonClass} ref={ref} {...props}>
        {children}
      </button>
    );
  },
);
