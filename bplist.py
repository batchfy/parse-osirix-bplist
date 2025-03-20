import argparse
import os
import pydicom
from glob import glob
import sys
import bplist
from biplist import readPlistFromString


def check_encapsulated_document(dicom_path):
    """Check if DICOM file has EncapsulatedDocument attribute."""
    try:
        ds = pydicom.dcmread(dicom_path)
        if hasattr(ds, 'EncapsulatedDocument'):
            print(f"\nFound EncapsulatedDocument in: {dicom_path}")
            print(f"SOP Class UID: {ds.SOPClassUID}")
            print(f"SOP Instance UID: {ds.SOPInstanceUID}")
            return dicom_path
        return None
    except Exception as e:
        print(f"Error reading {dicom_path}: {str(e)}")
        return False

def main():
    parser = argparse.ArgumentParser(description='Find DICOM files with EncapsulatedDocument')
    parser.add_argument('directory', help='Directory to search for DICOM files')
    args = parser.parse_args()

    if not os.path.isdir(args.directory):
        print(f"Error: {args.directory} is not a valid directory")
        return

    print(f"Searching for DICOM files in {args.directory}...")
    dicom_files = glob(f"""{args.directory}/**/*.dcm""", recursive=True)
    print(f"Found {len(dicom_files)} DICOM files")

    encapsulated_count = 0
    for dicom_file in dicom_files:
        ds = pydicom.dcmread(dicom_file)
        if hasattr(ds, 'EncapsulatedDocument'):
            bplist_data = ds.EncapsulatedDocument
            try:
                parsed_data = readPlistFromString(bplist_data)
            except Exception as e:
                save_path = f"bplist/{dicom_file}.bplist"
                os.makedirs(os.path.dirname(save_path), exist_ok=True)
                with open(save_path, "wb") as f:
                    f.write(bplist_data)
                print(f"Error parsing bplist in {dicom_file}: {str(e)}")
                continue
            print(f"Parsed bplist data from {dicom_file}")

if __name__ == "__main__":
    main()