#!/usr/bin/env -S uv run --script
# Use
# ./app.sh directlink.ext

import sys
import httpx
from pathlib import Path
from rich.progress import Progress, SpinnerColumn, BarColumn, TextColumn, DownloadColumn, TransferSpeedColumn, TimeRemainingColumn

def download(url):
    filename = url.split("/")[-1] or "downloaded_file"
    
    with Progress(
        SpinnerColumn(),
        TextColumn("[bold blue]{task.description}"),
        BarColumn(bar_width=40),
        "[progress.percentage]{task.percentage:>3.0f}%",
        DownloadColumn(),
        TransferSpeedColumn(),
        TimeRemainingColumn(),
    ) as progress:
        
        task_id = progress.add_task(f"Downloading {filename}", total=None)
        
        try:
            with httpx.stream("GET", url, follow_redirects=True) as response:
                total = int(response.headers.get("Content-Length", 0))
                progress.update(task_id, total=total)
                
                with open(filename, "wb") as f:
                    for chunk in response.iter_bytes():
                        f.write(chunk)
                        progress.update(task_id, advance=len(chunk))
        except Exception as e:
            print(f"\n[red]Error: {e}[/red]")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: down <URL>")
    else:
        download(sys.argv[1])
