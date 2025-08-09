export interface screentimePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
