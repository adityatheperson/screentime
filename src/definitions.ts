export interface ScreenTimePlugin {
    enableScreenTimeAccess(): Promise<void>;
    setAppLimit(appIdentifier: string, limit: number): Promise<void>;
    getAppUsage(appIdentifier: string): Promise<{ usage: number }>;
}
