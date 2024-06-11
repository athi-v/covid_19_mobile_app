Function formatNumber = (number) {
  if (number < 1000) {
    return number.toString();
  }
  if (number >= 1000 && number < 1000000) {
    return (number / 1000).toStringAsFixed(1) + "K";
  }
  if (number >= 1000000 && number < 1000000000) {
    return (number / 1000000).toStringAsFixed(1) + "M";
  }
  if (number >= 1000000000) {
    return (number / 1000000000).toStringAsFixed(1) + "B";
  }
};
