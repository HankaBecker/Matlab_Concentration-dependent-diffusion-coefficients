%% doi: 10.5281/zenedo.2321522

# Matlab_Concentration-dependent-diffusion-coefficients
GUI - Concentration dependent diffusion coefficient: Function to evaluate concentration profiles of Cu-Ni to derive concentration dependent diffusion coefficients using Sauer-Freise-den Broeder method with 2 options - (1) analytical solution by fitting Five-parameter logistic function to data - (2) numerical solution by purely numerical solution

components of code

- importing data in format:
        column 1 - index
        column 2 - e.g. position    [µm]
        column 3 - concentration    [%]
        column 4 - concentration    [%]
- additional information required:
        unit of concentrations - at or wt
        step size of line scan      [µm]
        time                        [s]

- calclulation of diffsion components
    option 1: analytical
            fitting Five-parameter logistic function to data which is used
            for calculating diffusion coefficients
    option 2: numerical
            diffusion coeffcients are calculated purely numerically from
            experimental data

- plotting and exporting all relevant graphs

- exporting data to excel files in small or extended format saving data
    from calculation options in separate excel sheets
            option 1: to excel sheet 1
            option 2: to excel sheet 2
