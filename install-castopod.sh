#!/bin/bash
################################################################################
# Castopod Installation Script (FrankenPHP + Caddy)
# This script installs Castopod on Linux using FrankenPHP with built-in Caddy
# Usage: ./install-castopod.sh [domain1] [domain2] ... [--env-file /path/to/.env]
################################################################################

set -e  # Exit on any error

################################################################################
# Color definitions
################################################################################
# Castopod brand color #009486 (teal) on white background
LOGO_COLOR="\033[38;2;0;148;134m\033[48;2;255;255;255m"
RESET_COLOR="\033[0m"

################################################################################
# Help function
################################################################################
show_help() {
    echo -e "${LOGO_COLOR}"
    cat << 'EOF'
                     ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                     
                    ███████▀▀███████████████████████▀▀██████                    
                    ██████▄███████████████████████████▄█████                    
                    ██████▀▀                        ▀▀██████                    
                    █████▀    ▄▄                ▄▄    ▀█████                    
                    █████    █▀▀█     ▄  ▄     █▀▀█    █████                    
                    ██████             ▀▀             ██████                    
                    ████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄████████                    
                    ████████████████████████████████████████                    
                    ████████████████████████████████████████                    
                    ██████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██████████                    
                     ▀▀▀▀▀▀▀▀                      ▀▀▀▀▀▀▀▀                     
                                                           ▄                    
                     ▄▄  ▄▄▄   ▄▄ ▄█▄▄  ▄▄  ▄ ▄▄   ▄▄   ▄▄ █                    
                    █  ▀  ▄▄█ ▀▄▄  █   █  █ █▀  █ █  █ █  ▀█                    
                    ▀▄▄▀ ▀▄▄█ ▄▄▄▀ ▀▄▄ ▀▄▄▀ █▀▄▄▀ ▀▄▄▀ ▀▄▄▀█                    
                                            ▀                                   
EOF
    echo -e "${RESET_COLOR}"
    cat << 'EOF'
Castopod Installation Script (FrankenPHP + Caddy)
==================================================

DESCRIPTION:
    This script installs Castopod on Linux using FrankenPHP (PHP application
    server with built-in Caddy web server). This provides a simpler stack with
    automatic HTTPS and excellent performance.

USAGE:
    sudo ./install-castopod.sh [OPTIONS] [DOMAIN1] [DOMAIN2] ...

OPTIONS:
    --help, -h          Show this help message and exit
    --non-interactive, -y
                        Run in non-interactive mode (no prompts or confirmations)
    --env-file PATH     Path to a .env file with default values to be copied
                        to each Castopod instance (useful for email settings,
                        legal notice URL, etc.)
    --package-url URL   Direct URL to Castopod package (.zip file)
                        Default: Latest version from official repository
                        Find packages at: https://code.castopod.org/adaures/castopod/-/releases
                        Example: https://code.castopod.org/-/project/2/uploads/HASH/castopod-1.13.7.zip

PARAMETERS:
    DOMAIN              One or more domain names where Castopod will be installed.
                        If no domains are specified, only dependencies will be
                        installed.

DEPENDENCIES INSTALLED:
    - FrankenPHP (PHP application server with built-in Caddy)
    - MariaDB database server
    - FFmpeg for media processing
    - Redis/Valkey for caching

AUTOMATIC HTTPS:
    Caddy (built into FrankenPHP) automatically obtains and renews SSL
    certificates from Let's Encrypt. No manual certificate management needed.

EXAMPLES:
    # Interactive mode (default - will prompt for domains and confirmation):
    sudo ./install-castopod.sh

    # Non-interactive mode for a single domain:
    sudo ./install-castopod.sh -y podcast.example.com

    # Non-interactive mode for multiple domains:
    sudo ./install-castopod.sh --non-interactive podcast1.com podcast2.com podcast3.com

    # Non-interactive with a default .env file:
    sudo ./install-castopod.sh -y podcast.com --env-file /path/to/default.env

    # Install a specific Castopod version:
    sudo ./install-castopod.sh -y podcast.com --package-url https://code.castopod.org/-/project/2/uploads/HASH/castopod-1.13.7.zip

NOTES:
    - This script must be run as root (use sudo)
    - By default, the script runs in interactive mode with prompts and confirmations
    - Use --non-interactive or -y flag to skip all prompts (useful for automation)
    - ALL system packages will be upgraded before installing (may take several minutes)
    - Domains must have DNS properly configured and pointing to this server
    - SSL certificates are automatically obtained and renewed by Caddy
    - Each instance gets its own database, Redis database number, and configuration
    - Installation directories are created at: /var/www/castopod/DOMAIN_NAME
    - Redis databases are automatically expanded if needed (adds 16 at a time)

FOR MORE INFORMATION:
    Visit: https://castopod.org
    Documentation: https://docs.castopod.org
    FrankenPHP: https://frankenphp.dev
    Caddy: https://caddyserver.com

EOF
    exit 0
}

################################################################################
# Disclaimer function
################################################################################
show_disclaimer() {
    clear
    echo -e "${LOGO_COLOR}"
    cat << 'EOF'
                     ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                     
                    ███████▀▀███████████████████████▀▀██████                    
                    ██████▄███████████████████████████▄█████                    
                    ██████▀▀                        ▀▀██████                    
                    █████▀    ▄▄                ▄▄    ▀█████                    
                    █████    █▀▀█     ▄  ▄     █▀▀█    █████                    
                    ██████             ▀▀             ██████                    
                    ████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄████████                    
                    ████████████████████████████████████████                    
                    ████████████████████████████████████████                    
                    ██████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██████████                    
                     ▀▀▀▀▀▀▀▀                      ▀▀▀▀▀▀▀▀                     
                                                           ▄                    
                     ▄▄  ▄▄▄   ▄▄ ▄█▄▄  ▄▄  ▄ ▄▄   ▄▄   ▄▄ █                    
                    █  ▀  ▄▄█ ▀▄▄  █   █  █ █▀  █ █  █ █  ▀█                    
                    ▀▄▄▀ ▀▄▄█ ▄▄▄▀ ▀▄▄ ▀▄▄▀ █▀▄▄▀ ▀▄▄▀ ▀▄▄▀█                    
                                            ▀                                   
EOF
    echo -e "${RESET_COLOR}"
    cat << 'EOF'
================================================================================
              CASTOPOD INSTALLATION SCRIPT (FrankenPHP + Caddy)
                           Script version: 1.0.0
       Report issues: https://code.castopod.org/adaures/castopod/-/issues
================================================================================
PURPOSE:
    Install Castopod with FrankenPHP, MariaDB, Redis, and FFmpeg.
    Automatic HTTPS via Caddy's built-in ACME support.
REQUIREMENTS:
    Root access, domain(s) pointing to this server, ports 80/443 open, supported OS.
WHAT WILL BE MODIFIED:
    * System packages will be upgraded (apt-get dist-upgrade / dnf upgrade)
    * FrankenPHP will be installed to /usr/local/bin/
    * MariaDB databases will be created
    * Redis configuration may be modified (if more databases are needed)
    * Cron jobs will be added
    * Files will be created in /var/www/castopod/
    * Systemd service will be created for FrankenPHP

================================================================================
                          LIMITATION OF LIABILITY
================================================================================
THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR OTHER DEALINGS IN THE SOFTWARE.
By proceeding, you acknowledge that:
* You have read and understood this disclaimer
* You accept all risks associated with running this script
* You have backed up any important data on this server
* You understand this script will make system-level changes
================================================================================

EOF

    # Ask for confirmation
    read -p "Do you want to proceed with the installation? (yes/no): " CONFIRMATION < /dev/tty

    # Convert to lowercase
    CONFIRMATION=$(echo "$CONFIRMATION" | tr '[:upper:]' '[:lower:]')

    # Check confirmation
    if [[ "$CONFIRMATION" != "yes" ]] && [[ "$CONFIRMATION" != "y" ]]; then
        echo ""
        echo "Installation cancelled by user."
        exit 0
    fi

    echo ""
    echo "Proceeding with installation..."
    echo ""
}

################################################################################
# Check for help flag first (before root check)
################################################################################
for arg in "$@"; do
    if [[ "$arg" == "--help" ]] || [[ "$arg" == "-h" ]]; then
        show_help
    fi
done

################################################################################
# Check if script is run as root
################################################################################
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root"
    exit 1
fi

################################################################################
# Parse command line arguments
################################################################################
DOMAINS=()
DEFAULT_ENV_FILE=""
PACKAGE_URL=""
INTERACTIVE=true

# Loop through all arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --help|-h)
            # Show help message (already handled above, but keep for consistency)
            show_help
            ;;
        --non-interactive|-y)
            # Non-interactive mode
            INTERACTIVE=false
            shift
            ;;
        --env-file)
            # Next argument is the env file path
            if [ -z "$2" ] || [[ "$2" == -* ]]; then
                echo "ERROR: --env-file requires a path argument"
                exit 1
            fi
            DEFAULT_ENV_FILE="$2"
            shift 2
            ;;
        --package-url)
            # Next argument is the package URL
            if [ -z "$2" ] || [[ "$2" == -* ]]; then
                echo "ERROR: --package-url requires a URL argument"
                exit 1
            fi
            PACKAGE_URL="$2"
            shift 2
            ;;
        *)
            # Add to domains array
            DOMAINS+=("$1")
            shift
            ;;
    esac
done

################################################################################
# Show disclaimer and get confirmation (interactive mode only)
################################################################################
if [ "$INTERACTIVE" = true ]; then
    show_disclaimer

    # If no domains were provided as arguments, ask for them interactively
    if [ ${#DOMAINS[@]} -eq 0 ]; then
        echo "================================================================================
"
        echo "DOMAIN CONFIGURATION (OPTIONAL)"
        echo ""
        echo "Enter the domain names where you want to install Castopod instances."
        echo "You can enter multiple domains separated by spaces."
        echo ""
        echo "If you don't provide any domains, the script will only install the required"
        echo "software (FrankenPHP, MariaDB, Redis, FFmpeg) without setting up"
        echo "any Castopod instances. You can run the script again later with domain names"
        echo "to install Castopod instances."
        echo ""
        echo "Press ENTER without typing anything to install dependencies only."
        echo ""
        read -p "Domain name(s), space-separated [optional]: " DOMAIN_INPUT < /dev/tty

        # Parse space-separated domains
        if [ -n "$DOMAIN_INPUT" ]; then
            read -ra DOMAINS <<< "$DOMAIN_INPUT"
        fi
    fi

    # If no env file was provided as argument, ask for it interactively
    if [ -z "$DEFAULT_ENV_FILE" ]; then
        echo ""
        echo "================================================================================
"
        echo "DEFAULT CONFIGURATION FILE (OPTIONAL)"
        echo ""
        echo "You can provide a .env file with default values that will be added to"
        echo "each Castopod instance (useful for email settings, legal notice URL, etc.)."
        echo "Press ENTER to skip this step."
        echo ""
        read -p "Path to default .env file (optional): " ENV_FILE_INPUT < /dev/tty

        if [ -n "$ENV_FILE_INPUT" ]; then
            # Expand tilde to home directory if present
            ENV_FILE_INPUT="${ENV_FILE_INPUT/#\~/$HOME}"
            DEFAULT_ENV_FILE="$ENV_FILE_INPUT"
        fi
    fi

    # If no package URL was provided as argument, ask for it interactively
    if [ -z "$PACKAGE_URL" ]; then
        echo ""
        echo "================================================================================"
        echo "CASTOPOD PACKAGE URL (OPTIONAL)"
        echo ""
        echo "You can provide a direct URL to a specific Castopod version (.zip file)."
        echo "Press ENTER to use the latest version from the official repository."
        echo ""
        echo "Find packages at: https://code.castopod.org/adaures/castopod/-/releases"
        echo ""
        echo "Example: https://code.castopod.org/-/project/2/uploads/HASH/castopod-1.13.7.zip"
        echo ""
        read -p "Package URL (optional): " PACKAGE_URL_INPUT < /dev/tty

        if [ -n "$PACKAGE_URL_INPUT" ]; then
            PACKAGE_URL="$PACKAGE_URL_INPUT"
        fi
    fi

    echo ""
fi

# Verify the env file exists if provided
if [ -n "$DEFAULT_ENV_FILE" ] && [ ! -f "$DEFAULT_ENV_FILE" ]; then
    echo "ERROR: Default .env file not found: $DEFAULT_ENV_FILE"
    exit 1
fi

################################################################################
# Initialize log file and installation tracking
################################################################################
# Main log file for this installation session
LOG_FILE="$(pwd)/castopod-install-$(date +%Y%m%d_%H%M%S).log"
touch "$LOG_FILE"
chmod 600 "$LOG_FILE"  # Secure log file (contains passwords)

# Array to store installation information for summary
declare -a INSTALL_SUMMARY

# Function to log messages to both console and log file
log_message() {
    local message="$1"
    echo "$message" | tee -a "$LOG_FILE"
}

# Function to log to file only (for sensitive info)
log_to_file() {
    local message="$1"
    echo "$message" >> "$LOG_FILE"
}

################################################################################
# Redis management functions
################################################################################
get_redis_conf_path() {
    # Common Redis/Valkey configuration file locations
    # Note: Fedora 41+ uses Valkey instead of Redis
    local possible_paths=(
        "/etc/redis/redis.conf"
        "/etc/redis.conf"
        "/usr/local/etc/redis/redis.conf"
        "/usr/local/etc/redis.conf"
        "/etc/valkey/valkey.conf"
        "/etc/valkey.conf"
    )

    for path in "${possible_paths[@]}"; do
        if [ -f "$path" ]; then
            echo "$path"
            return 0
        fi
    done

    # If not found, return empty (return 0 to avoid set -e exit)
    echo ""
    return 0
}

################################################################################
# Function to get current max Redis databases configured
################################################################################
get_redis_max_databases() {
    local redis_conf=$(get_redis_conf_path)

    if [ -z "$redis_conf" ]; then
        # Default Redis databases value
        echo 16
        return
    fi

    # Extract databases value from redis.conf
    local max_dbs=$(grep -E "^databases\s+" "$redis_conf" | awk '{print $2}')

    if [ -z "$max_dbs" ]; then
        # Default if not found
        echo 16
    else
        echo "$max_dbs"
    fi
}

################################################################################
# Function to expand Redis databases if needed
################################################################################
expand_redis_databases() {
    local redis_conf=$(get_redis_conf_path)

    if [ -z "$redis_conf" ]; then
        echo "WARNING: Could not find Redis configuration file. Cannot expand databases."
        return 1
    fi

    local current_max=$(get_redis_max_databases)
    local new_max=$((current_max + 16))

    echo "Expanding Redis databases from $current_max to $new_max..."

    # Backup redis.conf
    cp "$redis_conf" "$redis_conf.bak.$(date +%Y%m%d_%H%M%S)"

    # Update databases value
    if grep -q "^databases\s\+" "$redis_conf"; then
        # Replace existing line
        sed -i "s/^databases\s\+[0-9]\+/databases $new_max/" "$redis_conf"
    else
        # Add line if it doesn't exist
        echo "databases $new_max" >> "$redis_conf"
    fi

    # Restart Redis/Valkey
    echo "Restarting Redis/Valkey..."
    if systemctl is-active --quiet redis-server; then
        systemctl restart redis-server
    elif systemctl is-active --quiet redis; then
        systemctl restart redis
    elif systemctl is-active --quiet valkey; then
        systemctl restart valkey
    else
        echo "WARNING: Could not restart Redis/Valkey automatically. Please restart it manually."
        return 1
    fi

    echo "Redis/Valkey databases expanded successfully!"
    return 0
}

################################################################################
# Function to get next available Redis database number
################################################################################
get_next_redis_db() {
    local max_db=0

    # Check all existing Castopod instances
    for d in /var/www/castopod/*/; do
        if [ -f "$d/.env" ]; then
            # Extract Redis database number from .env file
            local redis_db=$(sed -n 's/cache\.redis\.database=\([0-9]\+\)/\1/p' "$d/.env")
            if [ -n "$redis_db" ] && [ "$redis_db" -gt "$max_db" ]; then
                max_db=$redis_db
            fi
        fi
    done

    # Next available database number
    local next_db=$((max_db + 1))

    # Check if we need more databases
    local max_available=$(get_redis_max_databases)

    # If next_db would exceed available databases, expand Redis
    if [ "$next_db" -ge "$max_available" ]; then
        echo "Redis database $next_db exceeds maximum ($max_available). Expanding..." >&2
        if ! expand_redis_databases; then
            echo "ERROR: Failed to expand Redis databases." >&2
            exit 1
        fi
    fi

    # Return next available database number
    echo "$next_db"
}

# Start logging
log_message "================================================================================"
log_message "Castopod Installation Log (FrankenPHP + Caddy)"
log_message "Date: $(date)"
log_message "User: $(whoami)"
log_message "Log file: $LOG_FILE"
log_message "================================================================================"
log_message ""

# Display parsed parameters
echo "========================================="
echo "Castopod Installation Script"
echo "(FrankenPHP + Caddy)"
echo "========================================="
echo "Domains to install: ${#DOMAINS[@]}"
for domain in "${DOMAINS[@]}"; do
    echo "  - $domain"
done
if [ -n "$DEFAULT_ENV_FILE" ]; then
    echo "Default .env file: $DEFAULT_ENV_FILE"
fi
if [ -n "$PACKAGE_URL" ]; then
    echo "Package URL: $PACKAGE_URL"
else
    echo "Package version: Latest (auto-fetch)"
fi
echo "Log file: $LOG_FILE"
echo "========================================="
echo ""

# Log parameters
log_to_file "Installation Parameters:"
log_to_file "  Domains: ${DOMAINS[*]}"
log_to_file "  Default .env file: ${DEFAULT_ENV_FILE:-none}"
log_to_file "  Package URL: ${PACKAGE_URL:-latest (auto-fetch)}"
log_to_file "  Interactive mode: $INTERACTIVE"
log_to_file ""

################################################################################
# Detect Linux distribution
################################################################################
if [ -f /etc/os-release ]; then
    # Source the os-release file to get distribution info
    . /etc/os-release
    OS=$ID
    OS_VERSION=$VERSION_ID
else
    log_message "ERROR: Cannot detect Linux distribution"
    exit 1
fi

log_message "Detected OS: $OS $OS_VERSION"
log_to_file ""

################################################################################
# Detect system architecture
################################################################################
ARCH=$(uname -m)
case "$ARCH" in
    x86_64)
        FRANKENPHP_ARCH="linux-x86_64"
        ;;
    aarch64|arm64)
        FRANKENPHP_ARCH="linux-aarch64"
        ;;
    *)
        log_message "ERROR: Unsupported architecture: $ARCH"
        log_message "FrankenPHP supports x86_64 and aarch64 only"
        exit 1
        ;;
esac

log_message "Detected architecture: $ARCH (FrankenPHP: $FRANKENPHP_ARCH)"
log_to_file ""

################################################################################
# Function to check if a package is installed (Debian/Ubuntu)
################################################################################
is_package_installed_deb() {
    dpkg -l "$1" 2>/dev/null | grep -q "^ii"
}

################################################################################
# Function to check if a package is installed (RedHat/CentOS/Fedora)
################################################################################
is_package_installed_rpm() {
    rpm -q "$1" &>/dev/null
}

################################################################################
# Function to check if a package is installed (generic)
################################################################################
is_package_installed() {
    if [[ "$OS" == "ubuntu" ]] || [[ "$OS" == "debian" ]]; then
        is_package_installed_deb "$1"
    elif [[ "$OS" == "centos" ]] || [[ "$OS" == "rhel" ]] || [[ "$OS" == "fedora" ]]; then
        is_package_installed_rpm "$1"
    else
        echo "ERROR: Unsupported distribution"
        exit 1
    fi
}

################################################################################
# Upgrade system packages
################################################################################
log_message "Upgrading system packages..."
log_to_file "This may take a few minutes..."

if [[ "$OS" == "ubuntu" ]] || [[ "$OS" == "debian" ]]; then
    # Update package list
    echo "Updating package list..."
    apt-get update -qq

    # Upgrade all packages (use dist-upgrade to handle dependency changes)
    echo "Upgrading installed packages (this may take a while)..."
    apt-get dist-upgrade -y

    log_to_file "System packages upgraded successfully"

elif [[ "$OS" == "centos" ]] || [[ "$OS" == "rhel" ]] || [[ "$OS" == "fedora" ]]; then
    # Update and upgrade packages
    echo "Updating and upgrading packages (this may take a while)..."
    if [[ "$OS" == "fedora" ]]; then
        dnf upgrade -y
    else
        yum upgrade -y
    fi

    log_to_file "System packages upgraded successfully"
fi

echo "System upgrade completed!"
echo ""

################################################################################
# Install dependencies
################################################################################
log_message "Checking and installing dependencies..."

if [[ "$OS" == "ubuntu" ]] || [[ "$OS" == "debian" ]]; then
    # Update package list again after upgrade
    echo "Refreshing package list..."
    apt-get update -qq

    # Check and install MariaDB
    if ! is_package_installed mariadb-server; then
        echo "Installing MariaDB..."
        apt-get install -y mariadb-server mariadb-client
        # Start and enable MariaDB
        systemctl start mariadb
        systemctl enable mariadb
    else
        echo "MariaDB is already installed"
    fi

    # Check and install FFmpeg
    if ! command -v ffmpeg &> /dev/null; then
        echo "Installing FFmpeg..."
        apt-get install -y ffmpeg
    else
        echo "FFmpeg is already installed"
    fi

    # Check and install Redis
    if ! is_package_installed redis-server; then
        echo "Installing Redis..."
        apt-get install -y redis-server
        # Start and enable Redis
        systemctl start redis-server
        systemctl enable redis-server
    else
        echo "Redis is already installed"
    fi

    # Install required utilities and cron daemon
    apt-get install -y curl jq unzip rsync cron
    systemctl enable cron
    systemctl start cron

elif [[ "$OS" == "centos" ]] || [[ "$OS" == "rhel" ]] || [[ "$OS" == "fedora" ]]; then
    # Update package list
    echo "Updating package list..."
    if [[ "$OS" == "fedora" ]]; then
        dnf update -y
    else
        yum update -y
    fi

    # Install EPEL repository (for CentOS/RHEL)
    if [[ "$OS" != "fedora" ]]; then
        if ! is_package_installed epel-release; then
            echo "Installing EPEL repository..."
            yum install -y epel-release
        fi
    fi

    # Install MariaDB
    if ! is_package_installed mariadb-server; then
        echo "Installing MariaDB..."
        if [[ "$OS" == "fedora" ]]; then
            dnf install -y mariadb-server
        else
            yum install -y mariadb-server
        fi
        systemctl start mariadb
        systemctl enable mariadb
    else
        echo "MariaDB is already installed"
    fi

    # Install FFmpeg
    if ! command -v ffmpeg &> /dev/null; then
        echo "Installing FFmpeg..."
        if [[ "$OS" == "fedora" ]]; then
            dnf install -y ffmpeg
        else
            yum install -y ffmpeg
        fi
    else
        echo "FFmpeg is already installed"
    fi

    # Install Redis or Valkey (Fedora 41+ uses Valkey)
    if is_package_installed redis || is_package_installed valkey; then
        echo "Redis/Valkey is already installed"
    else
        echo "Installing Redis/Valkey..."
        if [[ "$OS" == "fedora" ]]; then
            # Fedora 41+ uses Valkey instead of Redis
            if dnf install -y valkey 2>/dev/null; then
                systemctl start valkey
                systemctl enable valkey
            else
                dnf install -y redis
                systemctl start redis
                systemctl enable redis
            fi
        else
            yum install -y redis
            systemctl start redis
            systemctl enable redis
        fi
    fi

    # Install utilities, cron daemon, and SELinux tools
    if [[ "$OS" == "fedora" ]]; then
        dnf install -y curl jq unzip rsync cronie policycoreutils-python-utils
        systemctl enable crond
        systemctl start crond
    else
        yum install -y curl jq unzip rsync cronie policycoreutils-python-utils
        systemctl enable crond
        systemctl start crond
    fi

    # Configure SELinux to allow web server to connect to Redis/database
    if command -v getenforce &> /dev/null && [ "$(getenforce)" != "Disabled" ]; then
        echo "Configuring SELinux for web server..."
        setsebool -P httpd_can_network_connect 1
    fi
fi

echo "Base dependencies installed successfully!"
echo ""

################################################################################
# Install FrankenPHP
################################################################################
log_message "Installing FrankenPHP..."

FRANKENPHP_BIN="/usr/local/bin/frankenphp"

# Check if FrankenPHP is already installed
if [ -f "$FRANKENPHP_BIN" ]; then
    echo "FrankenPHP is already installed at $FRANKENPHP_BIN"
    CURRENT_VERSION=$("$FRANKENPHP_BIN" version 2>/dev/null | head -n1 || echo "unknown")
    echo "Current version: $CURRENT_VERSION"
else
    echo "Downloading FrankenPHP..."

    # Get latest release URL from GitHub
    FRANKENPHP_RELEASE_URL="https://github.com/dunglas/frankenphp/releases/latest/download/frankenphp-${FRANKENPHP_ARCH}"

    echo "Downloading from: $FRANKENPHP_RELEASE_URL"
    curl -L "$FRANKENPHP_RELEASE_URL" -o "$FRANKENPHP_BIN"

    # Make executable
    chmod +x "$FRANKENPHP_BIN"

    echo "FrankenPHP installed to $FRANKENPHP_BIN"
fi

# Verify installation
if ! "$FRANKENPHP_BIN" version &>/dev/null; then
    log_message "ERROR: FrankenPHP installation failed or binary is not working"
    exit 1
fi

FRANKENPHP_VERSION=$("$FRANKENPHP_BIN" version 2>/dev/null | head -n1)
log_message "FrankenPHP version: $FRANKENPHP_VERSION"
log_to_file ""

echo ""

################################################################################
# Configure MariaDB to bind only to localhost
################################################################################
echo "Configuring MariaDB to bind only to localhost..."

# Check if bind-address is already set
MARIADB_CONF="/etc/mysql/mariadb.conf.d/50-server.cnf"
if [ ! -f "$MARIADB_CONF" ]; then
    # Alternative path for CentOS/RHEL
    MARIADB_CONF="/etc/my.cnf.d/mariadb-server.cnf"
fi

if [ ! -f "$MARIADB_CONF" ]; then
    # Fallback to main config
    MARIADB_CONF="/etc/my.cnf"
fi

# Ensure bind-address is set to 127.0.0.1
if grep -q "^bind-address" "$MARIADB_CONF" 2>/dev/null; then
    # Update existing bind-address
    sed -i 's/^bind-address.*/bind-address = 127.0.0.1/' "$MARIADB_CONF"
    echo "Updated existing bind-address in $MARIADB_CONF"
else
    # Add bind-address under [mysqld] section
    if grep -q "^\[mysqld\]" "$MARIADB_CONF" 2>/dev/null; then
        sed -i '/^\[mysqld\]/a bind-address = 127.0.0.1' "$MARIADB_CONF"
    else
        # Create [mysqld] section with bind-address
        echo -e "\n[mysqld]\nbind-address = 127.0.0.1" >> "$MARIADB_CONF"
    fi
    echo "Added bind-address to $MARIADB_CONF"
fi

# Restart MariaDB to apply changes
echo "Restarting MariaDB..."
systemctl restart mariadb

log_to_file "MariaDB security configuration:"
log_to_file "  Config file: $MARIADB_CONF"
log_to_file "  bind-address = 127.0.0.1 (localhost only)"
log_to_file ""

echo "MariaDB configured to accept connections from localhost only"
echo ""

################################################################################
# Configure Redis/Valkey to bind only to localhost
################################################################################
echo "Configuring Redis/Valkey to bind only to localhost..."

# Get Redis configuration file path
REDIS_CONF=$(get_redis_conf_path)

if [ -n "$REDIS_CONF" ] && [ -f "$REDIS_CONF" ]; then
    # Ensure bind is set to 127.0.0.1
    if grep -q "^bind " "$REDIS_CONF"; then
        # Update existing bind directive
        sed -i 's/^bind .*/bind 127.0.0.1/' "$REDIS_CONF"
        echo "Updated existing bind directive in $REDIS_CONF"
    else
        # Add bind directive
        echo "bind 127.0.0.1" >> "$REDIS_CONF"
        echo "Added bind directive to $REDIS_CONF"
    fi

    # Ensure protected-mode is enabled
    if grep -q "^protected-mode " "$REDIS_CONF"; then
        sed -i 's/^protected-mode .*/protected-mode yes/' "$REDIS_CONF"
    else
        echo "protected-mode yes" >> "$REDIS_CONF"
    fi

    # Restart Redis/Valkey to apply changes
    echo "Restarting Redis/Valkey..."
    if systemctl is-active --quiet redis-server; then
        systemctl restart redis-server
    elif systemctl is-active --quiet redis; then
        systemctl restart redis
    elif systemctl is-active --quiet valkey; then
        systemctl restart valkey
    fi

    log_to_file "Redis/Valkey security configuration:"
    log_to_file "  Config file: $REDIS_CONF"
    log_to_file "  bind = 127.0.0.1 (localhost only)"
    log_to_file "  protected-mode = yes"
    log_to_file ""

    echo "Redis/Valkey configured to accept connections from localhost only"
else
    echo "WARNING: Could not find Redis/Valkey configuration file. It may accept external connections."
    log_to_file "WARNING: Redis/Valkey configuration file not found"
fi

echo ""

################################################################################
# Create castopod user if it doesn't exist
################################################################################
if ! id -u castopod &>/dev/null; then
    echo "Creating castopod user..."
    # Create system user without home directory and login shell
    useradd -r -s /usr/sbin/nologin castopod
    echo "Castopod user created"
else
    echo "Castopod user already exists"
fi

# Create data directory for Caddy (SSL certificates)
mkdir -p /var/lib/castopod
chown castopod:castopod /var/lib/castopod
echo ""

################################################################################
# Determine web user for FrankenPHP
################################################################################
# FrankenPHP will run as the castopod user
WEB_USER="castopod"

log_message "FrankenPHP will run as user: $WEB_USER"
log_to_file ""

# Log important system paths
log_to_file "System Configuration Paths:"
log_to_file "  FrankenPHP binary: $FRANKENPHP_BIN"
log_to_file "  FrankenPHP version: $FRANKENPHP_VERSION"
log_to_file "  MariaDB socket: $(mysql -e 'SELECT @@socket;' 2>/dev/null | tail -n1 || echo 'Not yet installed')"
log_to_file "  Redis config: $(get_redis_conf_path || echo 'Not yet installed')"
log_to_file ""

echo ""

################################################################################
# Download Castopod package
################################################################################
echo "Downloading Castopod package..."

# Check if a custom package URL was provided
if [ -n "$PACKAGE_URL" ]; then
    # Use the provided package URL
    CASTOPOD_PACKAGE_URL="$PACKAGE_URL"
    echo "Using provided package URL: $CASTOPOD_PACKAGE_URL"
else
    # Fetch the latest release version
    RELEASE_URL="https://code.castopod.org/api/v4/projects/2/releases"
    echo "Fetching latest Castopod version..."
    CASTOPOD_VERSION=$(curl -L --silent "$RELEASE_URL" | jq '.[0] | .tag_name' | tr -d '"')

    # Check if version was retrieved successfully
    if [ -z "$CASTOPOD_VERSION" ]; then
        echo "ERROR: Failed to retrieve Castopod version"
        exit 1
    fi

    echo "Latest Castopod version: $CASTOPOD_VERSION"

    # Build URL for the specific release
    LATEST_RELEASE_URL="https://code.castopod.org/api/v4/projects/2/releases/${CASTOPOD_VERSION}"

    # Fetch the package URL
    echo "Fetching package download URL..."
    CASTOPOD_PACKAGE_URL=$(curl -L --silent "$LATEST_RELEASE_URL" | jq '.assets.links[].url' | grep -e '.zip' | tr -d '"')

    # Check if package URL was retrieved successfully
    if [ -z "$CASTOPOD_PACKAGE_URL" ]; then
        echo "ERROR: Failed to retrieve Castopod package URL"
        exit 1
    fi

    echo "Package URL: $CASTOPOD_PACKAGE_URL"
fi

# Download the package to /tmp
echo "Downloading Castopod package to /tmp/castopod.zip..."
curl -L --silent "$CASTOPOD_PACKAGE_URL" -o /tmp/castopod.zip

# Check if download was successful
if [ ! -f /tmp/castopod.zip ]; then
    echo "ERROR: Failed to download Castopod package"
    exit 1
fi

# Remove existing extracted directory if it exists
if [ -d /tmp/castopod ]; then
    echo "Removing existing /tmp/castopod directory..."
    rm -rf /tmp/castopod
fi

# Unzip the package
echo "Extracting Castopod package..."
unzip -q /tmp/castopod.zip -d /tmp

# Delete the zip file
echo "Cleaning up zip file..."
rm /tmp/castopod.zip

echo "Castopod package downloaded and extracted successfully!"
echo ""

################################################################################
# Install Castopod instances for each domain
################################################################################

# If no domains specified, exit
if [ ${#DOMAINS[@]} -eq 0 ]; then
    echo "No domains specified. Exiting."
    echo "Dependencies have been installed. Run this script with domain names to install Castopod instances."
    exit 0
fi

# Create base directory for Castopod installations
mkdir -p /var/www/castopod

# Create Caddy configuration directory
mkdir -p /etc/caddy
mkdir -p /var/log/caddy
chown castopod:castopod /var/log/caddy

################################################################################
# Function to generate random string for install gateway
################################################################################
generate_random_string() {
    # Generate 6 random alphanumeric characters
    tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 6
}

################################################################################
# Function to generate database password
################################################################################
generate_db_password() {
    # Generate 32 random alphanumeric characters
    tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 32
}

################################################################################
# Function to sanitize domain name for database use
################################################################################
sanitize_domain_for_db() {
    # Replace dots with dashes and remove other special characters
    echo "$1" | sed 's/\./-/g' | sed 's/[^a-zA-Z0-9-]//g'
}

################################################################################
# Initialize Caddyfile (only if it doesn't exist or is empty)
################################################################################
CADDYFILE="/etc/caddy/Caddyfile"

# Create Caddyfile with global options only if it doesn't exist
if [ ! -f "$CADDYFILE" ] || [ ! -s "$CADDYFILE" ]; then
    echo "Creating new Caddyfile with global options..."
    cat > "$CADDYFILE" <<'EOF'
# Castopod Caddyfile (managed by install script)
# FrankenPHP configuration for Castopod

{
    # Global options
    frankenphp
    order php_server before file_server

    # Log format
    log {
        output file /var/log/caddy/access.log
        format json
    }
}

EOF
else
    echo "Caddyfile already exists, will append new domain configurations..."
fi

################################################################################
# Loop through each domain and create an instance
################################################################################
for DOMAIN in "${DOMAINS[@]}"; do
    echo "========================================="
    echo "Installing Castopod for: $DOMAIN"
    echo "========================================="

    # Create installation directory
    INSTALL_DIR="/var/www/castopod/$DOMAIN"
    echo "Creating installation directory: $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"

    # Copy Castopod files
    echo "Copying Castopod files..."
    rsync --recursive --keep-dirlinks /tmp/castopod/ "$INSTALL_DIR/"

    # Set ownership: root owns everything except writable/ and public/media/
    echo "Setting ownership..."
    chown -R root:root "$INSTALL_DIR"
    chown -R castopod:castopod "$INSTALL_DIR/writable"
    chown -R castopod:castopod "$INSTALL_DIR/public/media"

    # Ensure directories are traversable and files are readable
    echo "Setting file permissions..."
    find "$INSTALL_DIR" -type d -exec chmod 755 {} \;
    find "$INSTALL_DIR" -type f -exec chmod 644 {} \;

    # Configure SELinux contexts for writable directories (Fedora/RHEL)
    if command -v getenforce &> /dev/null && [ "$(getenforce)" != "Disabled" ]; then
        echo "Configuring SELinux contexts..."
        semanage fcontext -a -t httpd_sys_rw_content_t "$INSTALL_DIR/writable(/.*)?" 2>/dev/null || true
        semanage fcontext -a -t httpd_sys_rw_content_t "$INSTALL_DIR/public/media(/.*)?" 2>/dev/null || true
        restorecon -Rv "$INSTALL_DIR" > /dev/null
    fi

    # Generate database credentials
    DB_NAME=$(sanitize_domain_for_db "$DOMAIN")
    DB_USER=$(sanitize_domain_for_db "$DOMAIN")
    DB_PASSWORD=$(generate_db_password)

    echo "Creating MariaDB database and user..."
    echo "Database name: $DB_NAME"
    echo "Database user: $DB_USER"

    # Create database and user in MariaDB
    mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"

    # Generate random install gateway key
    INSTALL_KEY=$(generate_random_string)
    echo "Generated install key: $INSTALL_KEY"

    # Generate analytics salt
    ANALYTICS_SALT=$(tr -dc \!\#-\&\(-\[\]-\_a-\~ </dev/urandom | head -c 64)

    # Get next available Redis database number
    REDIS_DB=$(get_next_redis_db)
    echo "Assigned Redis database: $REDIS_DB"

    # Create .env file
    echo "Creating .env file..."
    cat > "$INSTALL_DIR/.env" <<EOF
# Castopod Configuration for $DOMAIN
# Auto-generated by install script

app.baseURL="https://$DOMAIN"
media.baseURL="https://$DOMAIN"
admin.gateway="cp-admin"
auth.gateway="cp-auth"
install.gateway="$INSTALL_KEY-install"

database.default.hostname="127.0.0.1"
database.default.database="$DB_NAME"
database.default.username="$DB_USER"
database.default.password="$DB_PASSWORD"
database.default.DBPrefix="cp_"

cache.handler="redis"
cache.redis.database=$REDIS_DB

analytics.salt="$ANALYTICS_SALT"
EOF

    # Append default .env values if provided
    if [ -n "$DEFAULT_ENV_FILE" ]; then
        echo "Appending default .env values..."

        # Get absolute paths to avoid circular reference
        default_env_abs=$(realpath "$DEFAULT_ENV_FILE" 2>/dev/null || readlink -f "$DEFAULT_ENV_FILE" 2>/dev/null || echo "$DEFAULT_ENV_FILE")
        target_env_abs=$(realpath "$INSTALL_DIR/.env" 2>/dev/null || echo "$INSTALL_DIR/.env")

        # Only append if source and destination are different files
        if [ "$default_env_abs" != "$target_env_abs" ]; then
            echo "" >> "$INSTALL_DIR/.env"
            echo "# Default values from $DEFAULT_ENV_FILE" >> "$INSTALL_DIR/.env"
            cat "$DEFAULT_ENV_FILE" >> "$INSTALL_DIR/.env"
        else
            echo "WARNING: Default .env file is the same as target .env file. Skipping append to avoid circular reference."
        fi
    fi

    chown root:root "$INSTALL_DIR/.env"
    chmod 644 "$INSTALL_DIR/.env"

    # Define log file paths
    CADDY_ACCESS_LOG="/var/log/caddy/${DOMAIN}-access.log"
    CADDY_ERROR_LOG="/var/log/caddy/${DOMAIN}-error.log"

    # Check if domain already exists in Caddyfile
    if grep -q "^${DOMAIN} {" "$CADDYFILE" 2>/dev/null; then
        echo "WARNING: Domain $DOMAIN already exists in Caddyfile, skipping Caddy configuration..."
    else
        # Append domain configuration to Caddyfile
        echo "Adding Caddy configuration for $DOMAIN..."
        cat >> "$CADDYFILE" <<EOF

# Configuration for $DOMAIN
$DOMAIN {
    root * $INSTALL_DIR/public

    # Logging
    log {
        output file $CADDY_ACCESS_LOG
        format json
    }

    # PHP handling via FrankenPHP
    php_server

    # File server for static files
    file_server

    # Security headers
    header {
        X-Content-Type-Options nosniff
        X-Frame-Options DENY
        Referrer-Policy strict-origin-when-cross-origin
    }

    # Block access to sensitive files
    @blocked {
        path /.env
        path /.htaccess
        path /.user.ini
        path /writable/*
    }
    respond @blocked 404

    # Cache static assets
    @static {
        path *.jpg *.jpeg *.png *.gif *.ico *.css *.js *.svg *.woff *.woff2 *.ttf *.eot *.webp *.mp4
    }
    header @static Cache-Control "public, max-age=2592000, immutable"

    # Handle large uploads (512MB)
    request_body {
        max_size 512MB
    }
}

EOF

        # Format the Caddyfile to fix indentation
        echo "Formatting Caddyfile..."
        "$FRANKENPHP_BIN" fmt --overwrite "$CADDYFILE" 2>/dev/null || true
    fi

    # Create cron jobs in /etc/cron.d/ (system cron where user field is valid)
    echo "Creating cron jobs for scheduled tasks and session cleanup..."

    # Ensure /etc/cron.d/ directory exists
    mkdir -p /etc/cron.d

    # Create a sanitized filename from domain (replace dots with dashes)
    CRON_FILE="/etc/cron.d/castopod-$(echo $DOMAIN | tr '.' '-')"

    # Create cron file with proper format (must end with newline)
    cat > "$CRON_FILE" <<'CRON_EOF'
# Castopod cron jobs for $DOMAIN
# Created by castopod-install script on $(date)

SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

# Run Castopod scheduled tasks every minute (only errors are logged)
* * * * * root su -s /bin/bash -c '$FRANKENPHP_BIN php-cli $INSTALL_DIR/spark tasks:run 2>> $INSTALL_DIR/writable/logs/cron-errors.log' $WEB_USER

# Clean up old session files daily at 3:00 AM (only errors are logged)
0 3 * * * root su -s /bin/bash -c 'find $INSTALL_DIR/writable/session/ -type f -mtime +7 -delete 2>> $INSTALL_DIR/writable/logs/cron-errors.log' $WEB_USER

CRON_EOF

    # Substitute variables in the cron file
    sed -i "s|\$DOMAIN|$DOMAIN|g" "$CRON_FILE"
    sed -i "s|\$WEB_USER|$WEB_USER|g" "$CRON_FILE"
    sed -i "s|\$INSTALL_DIR|$INSTALL_DIR|g" "$CRON_FILE"
    sed -i "s|\$FRANKENPHP_BIN|$FRANKENPHP_BIN|g" "$CRON_FILE"
    sed -i "s|\$(date)|$(date)|g" "$CRON_FILE"

    # Set proper permissions and ownership for cron file
    chmod 644 "$CRON_FILE"
    chown root:root "$CRON_FILE"

    echo "Cron jobs created in: $CRON_FILE"
    log_to_file "Cron jobs created: $CRON_FILE"

    # Store installation information for summary
    INSTALL_URL="https://$DOMAIN/$INSTALL_KEY-install"

    # Create instance-specific log file
    INSTANCE_LOG="$INSTALL_DIR/installation.log"
    cat > "$INSTANCE_LOG" <<LOGEOF
===============================================================================
Castopod Installation Log for $DOMAIN
Date: $(date)
Stack: FrankenPHP + Caddy
===============================================================================

INSTALLATION DETAILS:
  Domain: $DOMAIN
  Installation URL: $INSTALL_URL
  Installation directory: $INSTALL_DIR
  .env file: $INSTALL_DIR/.env

DATABASE CONFIGURATION:
  Database name: $DB_NAME
  Database user: $DB_USER
  Database password: $DB_PASSWORD
  Database host: 127.0.0.1

REDIS CONFIGURATION:
  Redis database number: $REDIS_DB
  Redis config: $(get_redis_conf_path)

FRANKENPHP/CADDY CONFIGURATION:
  FrankenPHP binary: $FRANKENPHP_BIN
  Caddyfile: $CADDYFILE
  Document root: $INSTALL_DIR/public

SSL CERTIFICATES:
  Caddy automatically obtains and renews SSL certificates from Let's Encrypt.
  No manual certificate management is required.
  Certificates are stored in: /var/lib/castopod/caddy/

FILE PATHS:
  Application files: $INSTALL_DIR/
  Writable directory: $INSTALL_DIR/writable/
  Media directory: $INSTALL_DIR/public/media/
  Session directory: $INSTALL_DIR/writable/session/

CRON JOBS:
  Cron file: $CRON_FILE
  Cron errors: $INSTALL_DIR/writable/logs/cron-errors.log
  Tasks: * * * * * (runs Castopod scheduled tasks)
  Cleanup: 0 3 * * * (deletes session files older than 7 days)

GATEWAYS:
  Admin: https://$DOMAIN/cp-admin
  Auth: https://$DOMAIN/cp-auth
  Install: https://$DOMAIN/$INSTALL_KEY-install

LOG FILES:
  Instance log:      $INSTANCE_LOG
  Installation log:  $LOG_FILE
  Castopod logs:     $INSTALL_DIR/writable/logs/
  Cron job errors:   $INSTALL_DIR/writable/logs/cron-errors.log
  Caddy access log:  $CADDY_ACCESS_LOG
  Caddy error log:   $CADDY_ERROR_LOG

DEBUGGING:
  If something goes wrong, check the log files above and the .env file.
  FrankenPHP status: systemctl status frankenphp
  FrankenPHP logs: journalctl -u frankenphp

===============================================================================
LOGEOF

    # Set permissions on instance log
    chmod 600 "$INSTANCE_LOG"
    chown root:root "$INSTANCE_LOG"

    # Add to installation summary array
    INSTALL_SUMMARY+=("$DOMAIN|$INSTALL_URL|$INSTALL_DIR|$INSTANCE_LOG|$DB_NAME|$DB_PASSWORD|$CADDYFILE|$CADDY_ACCESS_LOG|$CADDY_ERROR_LOG")

    # Log to main log file
    log_to_file "================================================================================"
    log_to_file "Installation completed for: $DOMAIN"
    log_to_file "================================================================================"
    log_to_file "Installation URL: $INSTALL_URL"
    log_to_file "Installation directory: $INSTALL_DIR"
    log_to_file "Instance log file: $INSTANCE_LOG"
    log_to_file "Database: $DB_NAME / $DB_USER / $DB_PASSWORD"
    log_to_file "Redis database: $REDIS_DB"
    log_to_file "Caddy config: $CADDYFILE"
    log_to_file "Caddy access log: $CADDY_ACCESS_LOG"
    log_to_file "Caddy error log: $CADDY_ERROR_LOG"
    log_to_file ""

    # Print brief completion message
    echo ""
    echo "========================================="
    echo "Installation complete for $DOMAIN!"
    echo "========================================="
    echo ""
done

################################################################################
# Restart cron daemon to reload cron.d files
################################################################################
echo "Restarting cron daemon..."
if systemctl restart cron 2>/dev/null; then
    echo "Cron daemon restarted (Debian/Ubuntu)"
    log_to_file "Cron daemon restarted (cron)"
elif systemctl restart crond 2>/dev/null; then
    echo "Cron daemon restarted (CentOS/RHEL/Fedora)"
    log_to_file "Cron daemon restarted (crond)"
else
    echo "WARNING: Could not restart cron daemon automatically"
    echo "  Please restart manually: systemctl restart cron"
    log_to_file "WARNING: Could not restart cron daemon"
fi
echo ""

################################################################################
# Create systemd service for FrankenPHP
################################################################################
echo "Creating systemd service for FrankenPHP..."

cat > /etc/systemd/system/frankenphp.service <<EOF
[Unit]
Description=FrankenPHP (Caddy + PHP) for Castopod
Documentation=https://frankenphp.dev
After=network.target network-online.target mariadb.service redis.service redis-server.service valkey.service
Requires=network-online.target

[Service]
Type=notify
User=castopod
Group=castopod
ExecStart=$FRANKENPHP_BIN run --config $CADDYFILE
ExecReload=$FRANKENPHP_BIN reload --config $CADDYFILE
TimeoutStopSec=5s
LimitNOFILE=1048576
LimitNPROC=512
PrivateTmp=true
ProtectSystem=full
AmbientCapabilities=CAP_NET_BIND_SERVICE

# Environment variables
Environment=PHP_INI_SCAN_DIR=:/etc/frankenphp/conf.d
Environment=XDG_DATA_HOME=/var/lib/castopod

[Install]
WantedBy=multi-user.target
EOF

################################################################################
# Create PHP configuration for FrankenPHP
################################################################################
echo "Creating PHP configuration for FrankenPHP..."

mkdir -p /etc/frankenphp/conf.d

cat > /etc/frankenphp/conf.d/99-castopod.ini <<'PHP_INI_EOF'
; Castopod PHP Configuration
; Increases limits for large podcast file uploads

; Maximum amount of memory a script may consume (default: 128M)
memory_limit = 512M

; Maximum time in seconds a script is allowed to parse input data (default: 60)
max_input_time = 600

; Maximum size of POST data that PHP will accept (default: 8M)
post_max_size = 512M

; Maximum size of an uploaded file (default: 2M)
upload_max_filesize = 512M

; Maximum execution time of each script in seconds (default: 30)
max_execution_time = 300
PHP_INI_EOF

echo "PHP configuration created at: /etc/frankenphp/conf.d/99-castopod.ini"

################################################################################
# Enable and start FrankenPHP service
################################################################################
echo "Enabling and starting FrankenPHP service..."

# Reload systemd daemon
systemctl daemon-reload

# Enable the service
systemctl enable frankenphp

# Restart the service (not just start) to ensure new config is loaded
# This handles both fresh installs and re-runs of the script
if systemctl is-active --quiet frankenphp; then
    echo "FrankenPHP is already running, restarting to apply new configuration..."
    systemctl restart frankenphp
else
    echo "Starting FrankenPHP service..."
    systemctl start frankenphp
fi

# Check status
if systemctl is-active --quiet frankenphp; then
    echo "FrankenPHP service started successfully!"
else
    echo "WARNING: FrankenPHP service may not have started correctly."
    echo "Check logs with: journalctl -u frankenphp"
fi

################################################################################
# Cleanup
################################################################################
log_message "Cleaning up temporary files..."
rm -rf /tmp/castopod

################################################################################
# Display comprehensive installation summary
################################################################################
echo ""
echo ""
echo "================================================================================"
echo "                    INSTALLATION COMPLETED SUCCESSFULLY!"
echo "================================================================================"
echo ""

if [ ${#INSTALL_SUMMARY[@]} -gt 0 ]; then
    echo "Total instances installed: ${#INSTALL_SUMMARY[@]}"
    echo "Stack: FrankenPHP + Caddy (automatic HTTPS)"
    echo ""

    # Display detailed information for each instance
    for entry in "${INSTALL_SUMMARY[@]}"; do
        IFS='|' read -r domain url install_dir instance_log db_name db_password caddy_conf caddy_access_log caddy_error_log <<< "$entry"
        echo "================================================================================"
        echo "Instance: $domain"
        echo "================================================================================"
        echo "  Installation URL:  $url"
        echo "  Admin URL:         https://$domain/cp-admin"
        echo "  Directory:         $install_dir"
        echo "  Database:          $db_name"
        echo "  Database password: $db_password"
        echo ""
    done

    echo "================================================================================"
    echo "                         CASTOPOD CONFIGURATION"
    echo "================================================================================"
    echo ""
    for entry in "${INSTALL_SUMMARY[@]}"; do
        IFS='|' read -r domain url install_dir instance_log db_name db_password caddy_conf caddy_access_log caddy_error_log <<< "$entry"
        echo "$domain:  $install_dir/.env"
    done
    echo ""
    echo "================================================================================"
    echo "                        FRANKENPHP/CADDY SERVICE"
    echo "================================================================================"
    echo ""
    echo "Caddyfile:         $CADDYFILE"
    echo "FrankenPHP binary: $FRANKENPHP_BIN"
    echo "Service status:    systemctl status frankenphp"
    echo "Service logs:      journalctl -u frankenphp"
    echo "Reload config:     systemctl reload frankenphp"
    echo ""
    echo "SSL Certificates:  Automatically managed by Caddy (Let's Encrypt)"
    echo "                   No manual renewal needed!"
    echo ""
    echo "================================================================================"
    echo "                              LOG FILES"
    echo "================================================================================"
    echo ""
    echo "Installation log:  $LOG_FILE"
    echo "FrankenPHP logs:   journalctl -u frankenphp"
    for entry in "${INSTALL_SUMMARY[@]}"; do
        IFS='|' read -r domain url install_dir instance_log db_name db_password caddy_conf caddy_access_log caddy_error_log <<< "$entry"
        echo ""
        echo "$domain:"
        echo "  Castopod logs:   $install_dir/writable/logs/"
        echo "  Caddy logs:      /var/log/caddy/${domain}-*.log"
    done
    echo ""
    echo "================================================================================"
    echo "                          SECURITY WARNING"
    echo "================================================================================"
    echo ""
    echo "  Complete the setup NOW! The installation URL is accessible to anyone"
    echo "  who has the secret key. The gateway is disabled after first use."
    echo ""
    for entry in "${INSTALL_SUMMARY[@]}"; do
        IFS='|' read -r domain url install_dir instance_log db_name db_password caddy_conf caddy_access_log caddy_error_log <<< "$entry"
        echo "  -> $url"
    done
    echo ""
else
    echo "No instances were installed. Dependencies have been set up."
    echo ""
    echo "Log file: $LOG_FILE"
    echo ""
fi

# Final log entry
log_to_file "================================================================================"
log_to_file "Installation completed successfully!"
log_to_file "Date: $(date)"
log_to_file "Total instances: ${#INSTALL_SUMMARY[@]}"
log_to_file "================================================================================"
