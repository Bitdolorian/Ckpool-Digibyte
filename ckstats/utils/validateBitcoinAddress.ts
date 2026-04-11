const DGB_REGEX = /^(D|S|3|dgb1)[a-zA-Z0-9]{20,60}$/;

export function validateBitcoinAddress(address: string): boolean {
  if (typeof address !== 'string') return false;
  if (address.length === 0) return false;
  return DGB_REGEX.test(address);
}
